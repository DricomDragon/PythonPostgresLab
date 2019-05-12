from PyInquirer import prompt, Validator, ValidationError
from prompt_toolkit import document
import regex

# Ask for a quantity

class QuantityValidator(Validator):
    def validate(self, document):
        ok = regex.match('^[1-9][0-9]*00$', document.text)
        if not ok:
            raise ValidationError(message = 'Quantity must be a positive integer multiple of 100')

class QuantityAsker:
    """Ask quantity for name entries"""
    def __init__(self):
        self.widget = [
            {
                'type':'input',
                'name':'number',
                'message':'Enter a quantity',
                'validate':QuantityValidator
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
