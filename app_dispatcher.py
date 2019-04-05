from connect import DataConsumer

credentials = "host=localhost dbname=logistics user=postgres password=postgres_password"

print('Start')

consumer = DataConsumer(credentials)

rows = consumer.getProductSet()

for r in rows:
	print(r)

print('End')