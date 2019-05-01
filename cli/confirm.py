from PyInquirer import prompt

# Ask for boolean confirmation

class Confirmer:
    def __init__(self):
        self.widget = [
            {
		'type':'confirm',
		'name':'ok',
		'message':'Please confirm',
		'default':True
            }
        ]

    def confirm(self):
        return prompt(self.widget)['ok']
