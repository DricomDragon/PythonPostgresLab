from consumer.connect import DataConsumer
from consumer.credentials import getCredentials
from model.product import Product

print('Start')

credentials = getCredentials()
consumer = DataConsumer(credentials)

rows = consumer.getProductSet()

for r in rows:
        pro = Product(r)
        print('id = ', pro.id, '; name = ', pro.name)
        print('- - -')

print('End')
