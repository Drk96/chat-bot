# Generated by Django 4.0.4 on 2022-05-16 02:23

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Intent',
            fields=[
                ('tag', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('patterns', models.CharField(max_length=5000)),
                ('responses', models.CharField(max_length=5000)),
            ],
        ),
    ]
