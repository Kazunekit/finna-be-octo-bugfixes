# Create your views here.
from django.shortcuts import redirect, render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required, permission_required

from votes.forms import RegistrationForm, LoginForm, IssueForm, PasswordForm, UserForm
from votes.models import Issue, Vote, User

def index(request):
	if request.user.is_authenticated():
		over = Issue.objects.over()
		voted = Issue.objects.filter(votes__in=
				request.user.vote_set.all().values_list('id', flat=True))
		issues = Issue.objects.active().exclude(votes__in=
				request.user.vote_set.all().values_list('id', flat=True))
		return render(request,
				'index.html.twig',
				{
					'issues':issues,
					'over' : over,
					'voted' : voted,
				}
			)
	else:
		request.form = LoginForm()
		return render(request,
				'login.html.twig',
				{'form': request.form}
			)

@permission_required('votes.add_issue')
def issueAdd(request):
	if request.method == 'POST':
		form = IssueForm(request.user, data=request.POST)
		if form.is_valid():
			issue = form.save()
			messages.add_message(request, messages.INFO, 'Issue has been added')
			return redirect(reverse('index'))
	else:
		form = IssueForm(request.user)

	return render(request,
			'newIssue.html.twig',
			{'form': form}
		)

def issueView(request, id):
	try:
		issue = Issue.objects.get(pk=id)
	except Issue.DoesNotExist:
		messages.add_message(request, messages.ERROR, 'Issue #%s not found'%(id))
		return redirect(reverse('index'))
	if request.user.has_perm('votes.add_vote'):
		voted = request.user.vote_set.filter(issue=id)
	else:
		voted = True
	return render(request,
			'issue.html.twig',
			{
				'issue': issue,
				'voted' : voted,
			}
		)
@permission_required('votes.add_vote')
def issueVote(request, id):
	try:
		issue = Issue.objects.get(pk=id)
	except Issue.DoesNotExist:
		messages.add_message(request, messages.ERROR, 'Issue #%s not found'%(id))
		return redirect(reverse('index'))
	voted = request.user.vote_set.filter(issue=id)
	query = request.GET
	if 'vote' in query and not voted and query['vote'] in ('Yae','Nay'):
		vote = Vote(vote=(query['vote']=='Yae'), issue=issue, user=request.user)
		vote.save()
		messages.add_message(request, messages.INFO, 'Your vote has been saved')
	return redirect(reverse('issue_view',kwargs={'id':id}))

def login(request):
	if request.method == 'POST':
		form = LoginForm(data=request.POST)

		if form.is_valid():
			from django.contrib.auth import login
			login(request, form.get_user())

		else:
			return render(request,
					'login.html.twig',
					{'form': form}
				)

	return redirect(reverse('index'))

def register(request):
	if request.method == 'POST':
		form = RegistrationForm(data=request.POST)

		if form.is_valid():
			new_user = form.save()
			from django.contrib.auth import authenticate, login
			user = authenticate(username=request.POST['username'],
					password=request.POST['password1'])
			login(request, user)

			return redirect(reverse('index'))
	else:
		form = RegistrationForm()
	return render(request,
			'register.html.twig',
			{'form' : form}
		)
@login_required
def logout(request):
	from django.contrib.auth import logout
	logout(request)
	return redirect(reverse('index'))

@login_required
def changePassword(request):
	if request.method == 'POST':
		form = PasswordForm(request.user, data=request.POST)
		if form.is_valid():
			user = form.save()
			messages.add_message(request, messages.INFO, 'Your password has been changed')
			return redirect(reverse('index'))
	else:
		form = PasswordForm(request.user)

	return render(request,
			'password.html.twig',
			{'form': form}
		)

@permission_required('votes.change_user')
def users(request):
	users = User.objects.all()
	return render(request,
			'users.html.twig',
			{'users':users}
		)

@permission_required('votes.change_user')
def userEdit(request, id):
	try:
		user = User.objects.get(pk=id)
	except Issue.DoesNotExist:
		messages.add_message(request, messages.ERROR, 'User #%s not found'%(id))
		return redirect(reverse('userAdmin'))
	if request.method == 'POST':
		form = UserForm(instance=user, data=request.POST)
		if form.is_valid():
			user = form.save()
			messages.add_message(request, messages.INFO, 'User info changed')
			return redirect(reverse("userEdit",kwargs={'id':id}))
	else:
		form = UserForm(instance=user)
	return render(request,
			'user.html.twig',
			{
				'user':user,
				'form':form,
			}
		)
