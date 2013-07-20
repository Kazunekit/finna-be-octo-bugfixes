from django import forms
from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm
from django.contrib.auth.models import Group

from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Div, Submit, HTML, Button, Row, Field
from crispy_forms.bootstrap import AppendedText, PrependedText, FormActions

from votes.models import User, Issue, Tag
from voting import settings

class RegistrationForm(forms.ModelForm):
	password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
	password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)

	def __init__(self, *args, **kwargs):
		super(RegistrationForm, self).__init__(*args, **kwargs)
		self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.layout = Layout(
				Field('username', placeholder="God"),
				Field('password1', placeholder="pwned"),
				Field('password2', placeholder="ditto"),
				FormActions(
					Submit('register', 'Register', css_class="btn-large"),
					HTML("<a class='btn' href='{% url \"index\" %}'>Login</a>")
				)
			)
	
	class Meta:
		model = User
		fields = ('username',)

	def clean_password2(self):
		# Check that the two password entries match
		password1 = self.cleaned_data.get("password1")
		password2 = self.cleaned_data.get("password2")
		if password1 and password2 and password1 != password2:
			raise forms.ValidationError("Passwords don't match")
		return password2

	def save(self, commit=True):
		# Save the provided password in hashed format
		user = super(RegistrationForm, self).save(commit=False)
		user.set_password(self.cleaned_data["password1"])
		if commit:
			user.save()
			default_group = Group.objects.get(name=settings.DEFAULT_GROUP)
			user.groups = [default_group]
			user.save()
		return user

class LoginForm(AuthenticationForm):
	def __init__(self, *args, **kwargs):
		super(LoginForm, self).__init__(*args, **kwargs)
		self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.layout = Layout(
				Field('username', placeholder="God"),
				Field('password', placeholder="pwned"),
				FormActions(
					Submit('login', 'Login', css_class="btn-large"),
					HTML("<a class='btn' href='{% url \"register\" %}'>Register</a>")
				)
			)

class PasswordForm(PasswordChangeForm):
	def __init__(self, user, *args, **kwargs):
		super(PasswordForm, self).__init__(user, *args, **kwargs)
		self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.layout = Layout(
				Field('old_password'),
				Field('new_password1'),
				Field('new_password2'),
				FormActions(
					Submit('save', 'Save', css_class="btn-large"),
					HTML("<a class='btn' href='{% url \"index\" %}'>Home</a>")
				)
			)

class IssueForm(forms.ModelForm):
	tags = forms.CharField(label='Tags', required=False)
	hiddenTags = forms.CharField(required=False)

	def __init__(self, user, *args, **kwargs):
		self.user = user
		super(IssueForm, self).__init__(*args, **kwargs)
		self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.layout = Layout(
				Field('title', placeholder='Title'),
				Field('content', id='content_id'),
				Field('tldr', placeholder='TL;DR'),
				Field('tags', placeholder='Tags for easy filtering', id='tags_id'),
				Field('hiddenTags', id='hidden_tags_id', type="hidden"),
				FormActions(
					Submit('save', 'Save')
				)
			)
	class Meta:
		model = Issue
		fields = ('title', 'content', 'tldr' )

	def save(self, commit=True):
		issue = super(IssueForm, self).save(commit=False)
		from datetime import datetime, timedelta
		from django.utils.timezone import utc
		from constance import config
		issue.ends = datetime.utcnow().replace(tzinfo=utc)+timedelta(days=config.VOTE_TIME)
		issue.user = self.user
		issue.save()
		tagList = [ "Open" ]
		if self.cleaned_data["hiddenTags"]:
			tagList = tagList + self.cleaned_data["hiddenTags"].split(',')
		if self.cleaned_data["tags"]:
			tagList.append(self.cleaned_data["tags"])
		for tag in tagList:
			tagM, created = Tag.objects.get_or_create(name=tag)
			issue.tags.add(tagM)
			tagM.save()
		if commit:
			issue.save()
		return issue

class UserForm(forms.ModelForm):
	all_groups = Group.objects.all()
	groups = forms.ModelMultipleChoiceField(queryset=Group.objects.all().order_by('-id'), widget=forms.CheckboxSelectMultiple())

	def __init__(self, *args, **kwargs):
		if 'instance' in kwargs:
			self.user = kwargs['instance']
			initial = kwargs.setdefault('initial', {})
			initial['groups'] = [ t.pk for t in kwargs['instance'].groups.all() ]

		forms.ModelForm.__init__(self, *args, **kwargs)
		self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.layout = Layout(
				Field('is_active'),
				Field('groups'),
				FormActions(
					Submit('save', 'Save', css_class="btn-large"),
				)
			)
	
	class Meta:
		model = User
		fields = ("is_active",)
	
	def save(self, commit=True):
		self.user.is_active = self.cleaned_data['is_active']
		self.user.groups.clear()
		self.user.groups = self.cleaned_data['groups']
		if commit == True:
			self.user.save()
		return self.user
