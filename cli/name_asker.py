from PyInquirer import prompt 

# Ask for a name for anyting 

class NameAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'input',
                'name':'name',
                'message':'Please enter a name'
            }
        ]

    def ask(self):
        return prompt(self.widget)['name']

