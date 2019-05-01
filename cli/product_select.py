from PyInquirer import prompt 

# Select multiple items from a list

class ProductSelecter:
    def __init__(self):
        self.widget = [
            {
                'type':'checkbox',
                'name':'ans',
                'message':'Select products',
                'choices':['No product']
            }
        ]

    def select(self):
        return prompt(self.widget)['ans']

    def selectInto(self, rawProList):
        choices = []
        for p in rawProList:
            choices.append({'key':p[0], 'name':p[1]})
        self.widget[0]['choices'] = choices
        return self.select()
