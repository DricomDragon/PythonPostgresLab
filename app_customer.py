from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from basic_display import BasicDisplay
from cli.select import Selecter
from cli.pass_asker import PassAsker
from cli.customer_action_asker import CustomerActionAsker
from cli.book_asker import BookAsker

print('|Customer application|')

credentials = getCredentials()
consumer = DataConsumer(credentials)

companyAsker = Selecter('Choose your company')
passAsker = PassAsker()
actionAsker = CustomerActionAsker()
bookAsker = BookAsker()

display = BasicDisplay()

# Login phase
compList = consumer.getCompanyNames()
compList.append('dev')

login = companyAsker.selectInto(compList)
pwd = passAsker.ask()

# Dummy password check
if pwd != "":
    print('Successfully logged as', login)
else:
    print('Name', login, 'not recognized.')
    print('(dummy password check : enter an non-empty password)')
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
