from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from basic_display import BasicDisplay
from cli.name_asker import NameAsker
from cli.pass_asker import PassAsker
from cli.customer_action_asker import CustomerActionAsker

print('|Customer application|')

credentials = getCredentials()
consumer = DataConsumer(credentials)

nameAsker = NameAsker()
passAsker = PassAsker()
actionAsker = CustomerActionAsker()

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
    else:
        print('Action', action, 'not implemented yet.')

print('End')
