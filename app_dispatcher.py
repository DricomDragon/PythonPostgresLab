from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from model.product import Product
from basic_display import BasicDisplay

display = BasicDisplay()
display.title('Dispatcher application')

credentials = getCredentials()
consumer = DataConsumer(credentials)

rows = consumer.getCompanyNames()

print('Companies to be delivered :')
for r in rows:
        print(r)
print('Application not implemented yet')

display.end()
