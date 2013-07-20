from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
	url(r'^$','votes.views.index', name='index'),
	url(r'^login$', 'votes.views.login', name='login'),
	url(r'^logout$', 'votes.views.logout', name='logout'),
	url(r'^register$', 'votes.views.register', name='register'),
	url(r'^password$', 'votes.views.changePassword', name='password'),
	url(r'^users$', 'votes.views.users', name='userAdmin'),
	url(r'^user/(?P<id>\d+)$', 'votes.views.userEdit', name='userEdit'),
	url(r'^issue/add$', 'votes.views.issueAdd', name='issue_add'),
	url(r'^issue/(?P<id>\d+)$', 'votes.views.issueView', name='issue_view'),
	url(r'^issue/(?P<id>\d+)/vote$', 'votes.views.issueVote', name='issue_vote'),
)
