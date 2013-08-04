from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager, Group
from django.utils.timezone import utc

from datetime import datetime

from app import settings
# Create your models here.

class UserManager(BaseUserManager):
	def create_user(self, username, password):
		if not username:
			raise ValueError('Users must have a username')
		
		user = self.model(
				username=username,
			)

		user.set_password(password)
		user.save(using=self._db)
		default_group = Group.objects.get(name=settings.DEFAULT_GROUP)
		user.groups = [default_group]
		user.save(using=self._db)
		return user

	def create_superuser(self, username, password):
		if not username:
			raise ValueError('Admin has to have a name')

		user = self.create_user(
				username, 
				password=password
			)

		user.is_superuser = True
		user.save(using=self._db)
		user.groups.clear()
		user.groups = [Group.objects.get(name='Admins')]
		user.save(using=self._db)
		return user

class User(AbstractBaseUser, PermissionsMixin):
	username = models.CharField(max_length=52, unique=True, db_index=True)
	is_active = models.BooleanField(default=True)

	objects = UserManager()

	USERNAME_FIELD = 'username'
	REQUIRED_FIELDS = []

	def get_full_name(self):
		return self.get_username()

	def get_short_name(self):
		return self.get_full_name()

	def __unicode__(self):
		return self.get_username()

	def vote_yae(self):
		return self.vote_set.filter(vote=True)

	def vote_nay(self):
		return self.vote_set.filter(vote=False)

class Tag(models.Model):
	name = models.CharField(max_length=125, blank=False, null=False)

	def __unicode__(self):
		return self.name


class IssueManager(models.Manager):
	def active(self):
		return self.filter(ends__gte=datetime.utcnow().replace(tzinfo=utc))
	def over(self):
		return self.filter(ends__lte=datetime.utcnow().replace(tzinfo=utc))

class Issue(models.Model):
	title = models.CharField(max_length=255, blank=False, null=False)
	content = models.TextField(blank=False, null=False)
	tldr = models.CharField(max_length=512, blank=True, null=True, help_text="A short summary of the question")
	submitted = models.DateTimeField(auto_now_add=True)
	ends = models.DateTimeField()
	user = models.ForeignKey('User', blank=False, null=False, on_delete=models.CASCADE)
	tags = models.ManyToManyField(Tag, related_name='issues')

	objects = IssueManager()

	def __unicode__(self):
		return self.title

	def is_active(self):
		return datetime.utcnow().replace(tzinfo=utc)<=self.ends

	def vote_count(self):
		return len(self.votes.all())

	def vote_yae(self):
		return self.votes.filter(vote=True)

	def vote_nay(self):
		return self.votes.filter(vote=False)

	def vote_percent_yae(self):
		count = self.vote_count()
		if count == 0:
			return 0
		return ((len(self.vote_yae())/float(self.vote_count()))*100)

	def vote_percent_nay(self):
		count = self.vote_count()
		if count == 0:
			return 0
		return 100-self.vote_percent_yae()

	def vote_result(self):
		yae = len(self.vote_yae())
		nay = len(self.vote_nay())
		if yae == nay:
			return 'Stale'
		if yae > nay:
			return 'Yae'
		if nay > yae:
			return 'Nay'
		return 'I\'m lost'

	class Meta:
		ordering = ('-submitted', )

class Vote(models.Model):
	vote = models.BooleanField(
			blank=False,
			null=False,
		)

	issue = models.ForeignKey('Issue', related_name='votes', blank=False, null=False, on_delete=models.CASCADE)
	user = models.ForeignKey('User', blank=False, null=False, on_delete=models.CASCADE)

	def __unicode__(self):
		return self.issue.title + ' - ' + self.user.get_username() + ' - ' + str(self.vote)

