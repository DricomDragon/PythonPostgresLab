from consumer.connect import DataConsumer
from consumer.credentials import getCredentials

print('Start')

credentials = getCredentials()
consumer = DataConsumer(credentials)

rows = consumer.getProductSet()

for r in rows:
	print(r)

print('End')
