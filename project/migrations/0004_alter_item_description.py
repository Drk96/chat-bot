# Generated by Django 4.0.4 on 2022-05-24 14:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0003_category_item'),
    ]

    operations = [
        migrations.AlterField(
            model_name='item',
            name='description',
            field=models.CharField(max_length=100),
        ),
    ]
