from PyInquirer import prompt 

# Ask for an action to manage orders

class CustomerActionAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'list',
                'name':'action',
                'message':'What do you want to do about orders ?',
                'choices':['list orders','list warehouses','new command','quit']
            }
        ]

    def ask(self):
        return prompt(self.widget)

