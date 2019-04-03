import connect.py

credentials = "host=appli-pfe.ec-nantes.fr dbname=app_bdonn_01 user=app2_01 password=osiris"

print('Start')

consumer = DataConsumer(credentials)

rows = consumer.getProductSet()

for r in rows:
	print(r)

print('End')