from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from basic_display import BasicDisplay
from cli.select import Selecter
from cli.pass_asker import PassAsker
from cli.customer_action_asker import CustomerActionAsker
from cli.book_asker import BookAsker
from cli.product_select import ProductSelecter
from cli.house_asker import HouseAsker
from cli.confirm import Confirmer
from datetime import date, timedelta

display = BasicDisplay()
display.title('Customer application')

credentials = getCredentials()
consumer = DataConsumer(credentials)

companyAsker = Selecter('Choose your company')
passAsker = PassAsker()
actionAsker = CustomerActionAsker()
bookAsker = BookAsker()
productAsker = ProductSelecter()
houseAsker = HouseAsker()
confirmAsker = Confirmer()

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
        if len(bookList) == 0:
            display.error('No book order for', login, 'yet.')
        else:
            bookId = bookAsker.select(bookList)
            itemList = consumer.getItemsOfOrder(bookId)
            if len(itemList) == 0:
                display.error('No item found for order', bookId)
            else:
                display.orderedItemList(itemList)
    elif action == 'list warehouses':
        houseList = consumer.getWarehousesOfCompany(login)
        if len(houseList) == 0:
            display.error('No warehouse for', login, 'yet.')
        else:
            display.warehouseList(houseList)
    elif action == 'new order':
        houseList = consumer.getWarehousesOfCompany(login)
        targetHouseId = houseAsker.select(houseList)
        proList = consumer.getProductSet()
        proSelectNameList = productAsker.selectInto(proList)
        productQuantityList = [100] * len(proSelectNameList)
        dueDate = date.today() + timedelta(15)
        if (confirmAsker.confirm()):
            consumer.addOrder(login, targetHouseId, proSelectNameList, productQuantityList, dueDate)
            consumer.commit()
        else:
            display.error('Order creation aborted')
    else:
        display.notImplemented(action)

display.end()
