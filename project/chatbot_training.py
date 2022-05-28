import os
from .models import Intent, Measurement, Category, Item
import random
import json
import pickle
import numpy as np
import nltk
from nltk.stem import WordNetLemmatizer

from tensorflow.python.keras.models import Sequential
from tensorflow.python.keras.layers import Dense, Activation, Dropout
from tensorflow.python.keras.optimizer_v2.gradient_descent import SGD

class ChatbotTraining:
    def categories_add_into_intents(category, intents):
        items = Item.objects.filter(category__contains=category)
        response = "<br> <b>" + category + "</b> <br>"
        for item in items:
            response += "<br>"
            response += "Name: " + item.name + "<br>"
            response += "Description: " + item.description + "<br>"
            response += '<img src="' + item.image + '" width="100" height="100"> <br>'
            response += "Color : " + item.color + "<br>"
            response += "Price : Rs.  " + item.price + "<br>"
        response += "<br>If you want to buy any above item. Please type <b>Buy [name of the item]</b><br>"

        intents += [{"tag": "see_" + category.strip(),
                     "patterns": [category, "Buy " + category, "take " + category, "get " + category,
                                  "Can i buy " + category,
                                  "What types of " + category + " do you have?",
                                  "Can I add another " + category + " to the cart?",
                                  "I want to buy some " + category],
                     "responses": [response]
                     }]

        return intents

    def create_json_format():
        # create Json File formate with all data set
        intents = json.loads(open('project/intents.json').read())

        measurements = Measurement.objects.all()
        response_measurements = "<br> <b>Size &nbsp;&nbsp; UK &nbsp;&nbsp; Chest &nbsp;&nbsp; Waist</b>"
        for m in measurements:
            response_measurements += "<br>"
            response_measurements += "<b>" + m.size + "</b> &nbsp;&nbsp;&nbsp; "
            response_measurements += m.uk + " &nbsp;&nbsp; "
            response_measurements += m.chest + " &nbsp;&nbsp; "
            response_measurements += m.waist + " &nbsp;&nbsp; "

        intents['intents'] += [{"tag": "shoes_size",
                                "patterns": ["How to measure t-shirt size", "choice of t-shirt size", "t-shirt size",
                                             "Where can I find the T-shirt Sizes?"],
                                "responses": [
                                    f"Please use the following table to convert T shirt sizes and measure your size. {response_measurements} "]
                                }]

        category = Category.objects.all()
        response = "<br> <b>Categories</b> <br>"
        for c in category:
            response += "<br>"
            response += "Name: <b>" + c.name + "</b><br>"
            response += "Description: " + c.description + "<br>"
            # all categories one by one
            intents['intents'] += ChatbotTraining.categories_add_into_intents(c.name, intents['intents'])

        intents['intents'] += [{"tag": "all_category",
                                "patterns": ["categories", "category", "selling categories", "Show all categories",
                                             "list of categories", "category list", "choose category", "styles",
                                             "See Category List", "I want to buy some cloths"],
                                "responses": [
                                    f"I have wide selection of T Shirt styles. Choose your favourite to see the full "
                                    f"range of models.. {response} "]
                                }]

        item = Item.objects.all()
        response = "<br> <b>All Items</b> <br>"
        buy_now_list = []
        for i in item:
            response += "<br>"
            response += "Name: " + i.name + "<br>"
            response += "Description: " + i.description + "<br>"
            response += '<img src="' + i.image + '" width="100" height="100"> <br>'
            response += "Color : " + i.color + "<br>"
            response += "Price : Rs.  " + i.price + "<br>"
            buy_now_list.append("buy " + i.name)
        response += "<br>If you want to buy any above item. Please type <b>Buy [name of the item]</b><br>"

        intents['intents'] += [{"tag": "see_all_items",
                                "patterns": ["see all items", "items you got", "items in shop",
                                             "all available items in shop", "show me all available items",
                                             "what are the items do you have?", "item list", "t-shit and crop tops"],
                                "responses": [response]
                                }]

        intents['intents'] += [{"tag": "buynow",
                                "patterns": buy_now_list,
                                "responses": [
                                    f"Excellent Choice! What size are you looking for? Please type the Size Letter using UK Size Standard. {response_measurements}"
                                ]
                                }]
        # print(intents)
        return json.dumps(intents, indent=2)

    def tranning_bot():
        # remove the existing training related files
        if os.path.isfile('project/classes.pkl'):
            os.remove('project/classes.pkl')
        if os.path.isfile('project/words.pkl'):
            os.remove('project/words.pkl')
        if os.path.isfile('project/chatbotmodel.h5'):
            os.remove('project/chatbotmodel.h5')
        lemmatizar = WordNetLemmatizer()
        intents = json.loads(ChatbotTraining.create_json_format())

        words = []
        classes = []
        documents = []
        ignore_letters = ['?', '!', '.', ',']

        # Get All data set and convert into lower case and map with tags
        for intent in intents['intents']:
            for pattern in intent['patterns']:
                word_list = nltk.word_tokenize(pattern)
                all_words_in_lower = [x.lower() for x in word_list]
                words.extend(all_words_in_lower)
                documents.append((all_words_in_lower, intent['tag']))
                if intent['tag'] not in classes:
                    classes.append(intent['tag'])

        # Word lemmatizing process and sorting alphabetical order and save into appropriate files
        words = [lemmatizar.lemmatize(word) for word in words if word not in ignore_letters]
        words = sorted(set(words))
        classes = sorted(set(classes))
        pickle.dump(words, open('project/words.pkl', 'wb'))
        pickle.dump(classes, open('project/classes.pkl', 'wb'))

        training = []
        output_empty = [0] * len(classes)

        for document in documents:
            bag = []
            word_patterns = document[0]
            word_patterns = [lemmatizar.lemmatize(word.lower()) for word in word_patterns]
            for word in words:
                bag.append(1) if word in word_patterns else bag.append(0)

            output_row = list(output_empty)
            output_row[classes.index(document[1])] = 1
            training.append([bag, output_row])

        # Setting up data for training process
        random.shuffle(training)
        training = np.array(training)

        train_x = list(training[:, 0])
        train_y = list(training[:, 1])

        # apply TensorFlow to implement with AI
        model = Sequential()
        model.add(Dense(128, input_shape=(len(train_x[0]),), activation='relu'))
        model.add(Dropout(0.5))
        model.add(Dense(64, activation='relu'))
        model.add(Dropout(0.5))
        model.add(Dense(len(train_y[0]), activation='softmax'))

        sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)
        model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])

        # create train model and save
        hist = model.fit(np.array(train_x), np.array(train_y), epochs=200, batch_size=5, verbose=1)
        model.save('project/chatbotmodel.h5', hist)
        return 'done'
