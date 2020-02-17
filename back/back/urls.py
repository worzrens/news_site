from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static

from django.contrib.auth import views as auth_views
from django.urls import path

from back import views
from back.forms import LoginForm

urlpatterns = [
    url(r'^/', views.index, name='index'),
    url(r'^home/', views.home, name='home'),
    url(r'^posts/', views.posts, name='posts'),
    url(r'^new_post/', views.new_post, name='new_post'),
    path('comments/<int:post_id>/', views.comments),

    url(r'^register/', views.register, name='register'),
    url(r'^email_confirmed/', views.email_confirmed, name='email_confirmed'),
    url(r'^login/$', auth_views.LoginView.as_view(authentication_form=LoginForm, template_name='auth/login.html'), name='login'),
    url(r'^logout/$', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    url(r'^activate_user/$', views.ActivateUser.as_view(), name='activate_user'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
