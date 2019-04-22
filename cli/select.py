from PyInquirer import prompt 

# Select an item from a list

class Selecter:
    def __init__(self, choices, question = 'Please select an item :'):
        self.widget = [
            {
                'type':'list',
                'name':'ans',
                'message':question,
                'choices':choices
            }
        ]

    def select(self):
        return prompt(self.widget)['ans']

    def selectInto(self, choices):
        self.widget[0]['choices'] = choices
        return self.select()
