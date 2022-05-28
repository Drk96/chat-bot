from django.shortcuts import render
from django.http import HttpResponse
from .models import Intent, Measurement
from .chatbot_training import ChatbotTraining
from .chatbot import Chatbot
import json
import random


def index(request):
    request.session['previous_tag'] = ['chatbot_info']
    return render(request, 'index.html')


def training(request):
    document = ChatbotTraining.tranning_bot()
    return HttpResponse(json.dumps(document))


def direct_to_right_tag(tag):
    list_of_intents = json.loads(ChatbotTraining.create_json_format())['intents']
    response_msg = ''
    for i in list_of_intents:
        if i['tag'].lower() == tag:
            response_msg = random.choice(i['responses'])
            break
    return response_msg


def chatbot_call(request):
    msg = request.POST['msg']
    res = Chatbot.get_response(msg)

    # print(request.session['previous_tag'][0])

    if request.session['previous_tag'][0] == 'shopping_advice':
        if msg in ['1', '2', '3', '4', '5']:
            res[0] = "I knew it! I also like " + msg + " style type, though I don t usually wear jeans. Strict dress " \
                                                       "code, you know. Now lets get you a T Shirt matching your " \
                                                       "jeans style. <br> "
            res[0] += direct_to_right_tag('all_category')
            res[1] = 'all_category'
        elif msg.lower() == "main menu":
            res[0] = direct_to_right_tag('menuoption')
            res[1] = 'menuoption'
        else:
            res[0] = "Sorry please type 1, 2, 3, 4 or 5. Otherwise you can return main menu by typing <b>Main menu</b>"
            res[1] = 'shopping_advice'

    if request.session['previous_tag'][0] == 'buynow':
        measurements = Measurement.objects.all()
        measurements_size = []
        for measurement in measurements:
            measurements_size.append(measurement.size.lower())

        if msg.lower() in measurements_size:
            res[0] = "Have it! Are you ready to Checkout? <b>(Yes/No)</b>"
            res[1] = "checkout"
        elif msg.lower() == "main menu":
            res[0] = direct_to_right_tag('menuoption')
            res[1] = 'menuoption'
        else:
            res[0] = "<i>Sorry please enter valid size name</i> <br><br>"
            res[0] += direct_to_right_tag('shoes_size')
            res[0] += "<br><br> Otherwise you can return main menu by typing <b>Main menu</b>"
            res[1] = 'buynow'

    if request.session['previous_tag'][0] == 'checkout':
        if msg.lower() == "yes" or msg == "y":
            res[0] = "<b>Done! Added to Cart</b><br> You can continue shopping<br><br>"
            res[0] += direct_to_right_tag('all_category')
            res[1] = 'all_category'
        elif msg.lower() == "no" or msg == "n":
            res[0] = "<b>Canceled Purchase</b><br> You can continue shopping<br><br>"
            res[0] += direct_to_right_tag('all_category')
            res[1] = 'all_category'
        else:
            res[0] = "Sorry I cannot understand.<br> Enter <b>(Yes/No)</b>"
            res[1] = 'checkout'

    request.session['previous_tag'] = [res[1]]
    request.session.modified = True
    return HttpResponse(res[0])
