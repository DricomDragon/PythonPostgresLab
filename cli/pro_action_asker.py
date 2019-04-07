from PyInquirer import prompt 

# Ask for an action to manage products

class ProActionAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'list',
                'name':'action',
                'message':'What do you want to do about products ?',
                'choices':['add','list','modify','quit']
            }
        ]

    def ask(self):
        return prompt(self.widget)

