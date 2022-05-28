from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='home'),
    path('chatbot/training/', views.training, name='training'),
    path('chatbot/chat_request/', views.chatbot_call, name='chatbot_call')
]