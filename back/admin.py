from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group, Permission

from .forms import CreateUserForm, ChangePostForm, ChangeCommentForm
from .models import User, Post, Comment


def make_moderator(modeladmin, request, queryset):
    queryset.update(role='editor', is_staff=True)
    pms = Permission.objects.filter(codename__in=["add_post", "change_post", 'add_comment', 'change_comment'])
    for user in queryset:
        user.user_permissions.add(*pms)
def make_user(modeladmin, request, queryset):
    queryset.update(role='user', is_staff=False, is_superuser=False)
    pms = Permission.objects.filter(codename__in=["add_post", "change_post", 'add_comment', 'change_comment', 'change_user', 'delete_user'])
    for user in queryset:
        user.user_permissions.remove(*pms)
make_moderator.short_description = "Give moderator privileges"
make_user.short_description = "Remove all privileges"


@admin.register(User)
class CustomUserAdmin(UserAdmin):
    add_form = CreateUserForm
    model = User

    list_filter = ('role', 'is_active')
    list_display = ['email', 'role', 'is_active']

    fieldsets = (
        ('Regular info', {'fields': ('email', 'role')}),
        ('Personal info', {'fields': ('name', 'last_name', 'date_of_birth')}),
    )
    ordering = ('email',)
    actions = [make_moderator, make_user]


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    model = Post

    form = ChangePostForm
    list_filter = ('status', 'created_by')
    list_display = ['created_by', 'created_at', 'status']

    fieldsets = (
        (None, {
            'fields': ('message', 'status'),
        }),
    )
    # fieldsets = (
    #     ('Regular info', {'fields': ('email', 'role')}),
    #     ('Personal info', {'fields': ('name', 'last_name', 'date_of_birth')}),
    # )
    # ordering = ('email',)
    # actions = [make_moderator, make_user]


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    model = Comment

    form = ChangeCommentForm
    list_filter = ('created_by',)
    list_display = ['created_by', 'created_at', 'to_post']

    fieldsets = (
        (None, {
            'fields': ('test',),
        }),
    )
    # fieldsets = (
    #     ('Regular info', {'fields': ('email', 'role')}),
    #     ('Personal info', {'fields': ('name', 'last_name', 'date_of_birth')}),
    # )
    # ordering = ('email',)
    # actions = [make_moderator, make_user]


admin.site.site_header = 'News Admin Panel'
admin.site.site_title = "News Admin Panel"
