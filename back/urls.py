from django.conf.urls import url
from django.contrib.auth import views as auth_views
from back import views
from back.forms import LoginForm

urlpatterns = [
    url(r'^register/', views.register, name='register'),
    url(r'^home/', views.home, name='home'),
    url(r'^email_confirmed/', views.email_confirmed, name='email_confirmed'),
    url(r'^login/$', auth_views.LoginView.as_view(authentication_form=LoginForm, template_name='login.html'), name='login'),
    url(r'^logout/$', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    url(r'^activate_user/$', views.ActivateUser.as_view(), name='activate_user'),
]
