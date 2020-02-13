from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser, User
from django.db import models


class UserManager(BaseUserManager):
    def create_user(self, email, password=None, name=None, last_name=None, date_of_birth=None):

        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("User must have a password")

        user = self.model(
            email=self.normalize_email(email),
            name=name,
            last_name=last_name,
            is_validated=False,
            date_of_birth=date_of_birth,
            role='user'
        )
        user.admin = False
        user.staff = False
        user.active = user.is_validated
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):

        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("User must have a password")

        # user = self.model(
        #     email=self.normalize_email(email),
        #     password=password,
        #     is_validated=True,
        #     role='admin'
        # )
        # user.set_password(password)
        # user.admin = True
        # user.staff = True
        # user.active = True
        # user.save(using=self._db)

        user = self.create_user(email, password, **extra_fields)
        user.is_superuser = True
        user.is_staff = True
        user.save()

        return user


class NewsSiteUser(AbstractUser):
    username = None
    email = models.EmailField(unique=True, primary_key=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    password = models.CharField(max_length=300)

    ROLE_CHOICES = [
        ('user', 'Regular User'),
        ('editor', 'Editor'),
        ('admin', 'Admin'),
    ]
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='user')
    is_validated = models.BooleanField(default=False)

    name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    date_of_birth = models.DateTimeField(blank=True, null=True)

    objects = UserManager()

    def __str__(self):
        return self.email


class Post(models.Model):
    text = models.TextField()
    html_body = models.TextField()

    POST_STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('declined', 'Declined'),
    ]
    status = models.CharField(max_length=20, choices=POST_STATUS_CHOICES, default='pending')

    created_at = models.DateTimeField(auto_now=True)
    created_by = models.ForeignKey(NewsSiteUser, on_delete=models.CASCADE)


class Comment(models.Model):
    text = models.TextField()
    to_post = models.ForeignKey(Post, on_delete=models.CASCADE)

    created_at = models.DateTimeField(auto_now=True)
    created_by = models.ForeignKey(NewsSiteUser, on_delete=models.CASCADE)