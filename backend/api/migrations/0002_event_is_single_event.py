# Generated by Django 4.1.7 on 2024-04-17 19:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='is_single_event',
            field=models.BooleanField(null=True),
        ),
    ]
