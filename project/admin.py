from django.contrib import admin
from .models import Intent, Measurement, Category, Item


# class IntentAdmin(admin.ModelAdmin):
#     list_display = ('tag', 'patterns')


class MeasurementAdmin(admin.ModelAdmin):
    list_display = ('size', 'uk', 'chest', 'waist')


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')


class ItemAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'color', 'category', 'price')


# admin.site.register(Intent, IntentAdmin)
admin.site.register(Measurement, MeasurementAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Item, ItemAdmin)
