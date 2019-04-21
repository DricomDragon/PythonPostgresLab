from PyInquirer import prompt 

# Ask for a name for a password 

class PassAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'password',
                'name':'pass',
                'message':'Please enter your password'
            }
        ]

    def ask(self):
        return prompt(self.widget)['pass']

