from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from model.product import Product
from basic_display import BasicDisplay
from cli.pro_action_asker import ProActionAsker

print('|Product management application|')

credentials = getCredentials()
consumer = DataConsumer(credentials)

actionAsker = ProActionAsker()
display = BasicDisplay()

running = True
while running:
    ans = actionAsker.ask()
    
    if ans['action'] == 'quit':
        running = False
    elif ans['action'] == 'list':
        proList = consumer.getProductSet()
        display.productList(proList)
    else:
        print('Action', ans['action'], 'not implemented yet.')

print('End')
