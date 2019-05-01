from PyInquirer import prompt 

# Select a warehouse from a list

class HouseAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'list',
                'name':'ans',
                'message':'Select a warehouse',
                'choices':['No warehouse provided yet']
            }
        ]

    def select(self, rawHouseList):
        choices = []
        for h in rawHouseList:
            choices.append({'name':str(h[0]) + ':' + h[3], 'value': h[0]})
        self.widget[0]['choices'] = choices
        return prompt(self.widget)['ans']
