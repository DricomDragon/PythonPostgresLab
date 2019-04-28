from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from model.product import Product
from basic_display import BasicDisplay
from cli.pro_action_asker import ProActionAsker
from cli.name_asker import NameAsker

display = BasicDisplay()
display.title('Product management application')

credentials = getCredentials()
consumer = DataConsumer(credentials)

actionAsker = ProActionAsker()
nameAsker = NameAsker()

running = True
while running:
    ans = actionAsker.ask()
    action = ans['action']
    
    if action == 'quit':
        running = False
    elif action == 'list':
        proList = consumer.getProductSet()
        display.productList(proList)
    elif action == 'add':
        name = nameAsker.ask()
        print('Adding product', name, '...')
        consumer.addProduct(name)
        consumer.commit()
        print('Done.')
    else:
        print('Action', action, 'not implemented yet.')

display.end()
