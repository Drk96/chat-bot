import requests

from .models import Intent
import os
import random
import json
import pickle
import numpy as np
import nltk
from nltk.stem import WordNetLemmatizer
from .chatbot_training import ChatbotTraining
from tensorflow.python.keras.models import load_model

# bring back data sets and training data
intents = json.loads(ChatbotTraining.create_json_format())
words = model = classes = []
if os.path.isfile('project/classes.pkl'):
    classes = pickle.load(open('project/classes.pkl', 'rb'))
if os.path.isfile('project/words.pkl'):
    words = pickle.load(open('project/words.pkl', 'rb'))
if os.path.isfile('project/chatbotmodel.h5'):
    model = load_model('project/chatbotmodel.h5')


class Chatbot:
    def matches_words_list(sentences):
        lemmatizar = WordNetLemmatizer()
        sentence_words = nltk.word_tokenize(sentences)
        sentence_words = [lemmatizar.lemmatize(word) for word in sentence_words]
        # print(sentence_words)
        bag = [0] * len(words)
        # print(bag)
        for w in sentence_words:
            for i, word in enumerate(words):
                if word.lower() == w.lower():
                    bag[i] = 1
        # print(bag)
        # print(np.array(bag))

        return np.array(bag)

    def get_response(msg):
        result = ''
        match_word_list = Chatbot.matches_words_list(msg)
        retrun_list = []
        # predict model data according to the analysis
        res = model.predict(np.array([match_word_list]))[0]
        # print(res)
        # this is the accuracy level. above range of this value will be got as accurate data set
        ERROR_THRESHOLD = 0.6
        results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
        results.sort(key=lambda x: x[1], reverse=True)
        # print(results)

        for r in results:
            # print(classes[r[0]])
            retrun_list.append({'intent': classes[r[0]]})
            # print(retrun_list)

        # searching related data response
        tag = 'no_tag'
        if retrun_list:
            tag = retrun_list[0]['intent']

            # print(tag)
            list_of_intents = json.loads(ChatbotTraining.create_json_format())['intents']
            for i in list_of_intents:
                if i['tag'].lower() == tag.lower():
                    result = random.choice(i['responses'])
                    break
        else:
            # if chatbot cannot recognize pattern below data responses will be displayed
            cannot_identify = ["Sorry,I can't understand you", "I didn't quite catch you, Can you re-phrase that",
                               "Sorry, Not sure what you saying"]
            result = random.choice(cannot_identify)
        return [result, tag]
