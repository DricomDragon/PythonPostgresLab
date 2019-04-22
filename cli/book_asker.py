from PyInquirer import prompt 

# Select a bookorder

class BookAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'list',
                'name':'id',
                'message':'Which book order do you want to examine ?',
                'choices':[]
            }
        ]

    def select(self, bookList):
        for rb in bookList:
            dic = {'key': rb[0], 'value': rb[0], 'name': str(rb[0]) + ' : ' + str(rb[1].isoformat())}
            self.widget[0]['choices'].append(dic)
        return prompt(self.widget)['id']

