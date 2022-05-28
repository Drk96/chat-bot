from django.db import models


class Intent(models.Model):
    tag = models.CharField(max_length=50, primary_key=True)
    patterns = models.CharField(max_length=5000)
    responses = models.CharField(max_length=5000)


class Measurement(models.Model):
    size = models.CharField(max_length=5)
    uk = models.CharField(max_length=10)
    chest = models.CharField(max_length=10)
    waist = models.CharField(max_length=10)


class Category(models.Model):
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=100)


class Item(models.Model):
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=100)
    color = models.CharField(max_length=10)
    category = models.CharField(max_length=20)
    price = models.CharField(max_length=20)
    image = models.CharField(max_length=2048)
