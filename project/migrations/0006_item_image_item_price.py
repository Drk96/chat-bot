# Generated by Django 4.0.4 on 2022-05-28 03:18

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0005_alter_item_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='item',
            name='image',
            field=models.CharField(default="", max_length=2048),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='item',
            name='price',
            field=models.CharField(default="", max_length=20),
            preserve_default=False,
        ),
    ]
