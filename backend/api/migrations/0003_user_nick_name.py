# Generated by Django 4.1.7 on 2023-11-22 12:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_revokedtoken'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='nick_name',
            field=models.CharField(max_length=50, null=True, unique=True),
        ),
    ]