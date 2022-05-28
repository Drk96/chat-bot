# Generated by Django 4.0.4 on 2022-05-24 14:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0002_measurement'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('description', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('description', models.CharField(max_length=20)),
                ('color', models.CharField(max_length=10)),
                ('category', models.CharField(max_length=10)),
            ],
        ),
    ]