from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from basic_display import BasicDisplay
from cli.name_asker import NameAsker
from cli.pass_asker import PassAsker
from cli.customer_action_asker import CustomerActionAsker
from cli.book_asker import BookAsker

print('|Customer application|')

credentials = getCredentials()
consumer = DataConsumer(credentials)

nameAsker = NameAsker()
passAsker = PassAsker()
actionAsker = CustomerActionAsker()
bookAsker = BookAsker()

display = BasicDisplay()

# Login phase
login = nameAsker.ask()
pwd = passAsker.ask()

compList = consumer.getCompanyNames()
compList.append('dev')

if login in compList:
    print('Successfully logged as', login)
else:
    print('Name', login, 'not recognized.')
    exit()

# Action phase
running = True
while running:
    ans = actionAsker.ask()
    action = ans['action']
    
    if action == 'quit':
        running = False
    elif action == 'list orders':
        bookList = consumer.getOrdersOfCompany(login)
        bookId = bookAsker.select(bookList)
        itemList = consumer.getItemsOfOrder(bookId)
        display.orderedItemList(itemList)
    else:
        print('Action', action, 'not implemented yet.')

print('End')
