from PyInquirer import prompt 

# Ask for a quantity

class QuantityAsker:
    def __init__(self):
        self.widget = [
            {
                'type':'input',
                'name':'number',
                'message':'Enter a quantity'
            }
        ]

    def askForOne(self, name):
        self.widget[0]['message'] = 'Quantity for ' + name + ' (g)'
        return int(prompt(self.widget)['number'])

    def askForEachOf(self, nameList):
        ans = []
        for name in nameList:
            ans.append(self.askForOne(name))
        return ans
