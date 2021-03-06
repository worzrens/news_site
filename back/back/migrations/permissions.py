# Generated by Django 2.2.8 on 2020-02-16 09:30

from django.db import migrations

from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType

from back.models import Post


def add_group_permissions(*args):
    post_content_type = ContentType.objects.get_for_model(Post)

    no_pm, created = Permission.objects.get_or_create(codename='no_premoderation',
                                                      name='User don\'t need premoderation',
                                                      content_type=post_content_type)

    user_group, created = Group.objects.get_or_create(name='user_group')
    moderator_group, created = Group.objects.get_or_create(name='moderator_group')
    admin_group, created = Group.objects.get_or_create(name='admin_group')

    moderator_group.permissions.add(no_pm)
    admin_group.permissions.add(no_pm)


class Migration(migrations.Migration):

    dependencies = [
        ('back', '0006_auto_20200216_0930'),
    ]

    operations = [
        migrations.RunPython(add_group_permissions),
    ]