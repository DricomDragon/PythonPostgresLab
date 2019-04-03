import psycopg2

conn = psycopg2.connect("host=appli-pfe.ec-nantes.fr dbname=app_bdonn_01 user=app2_01 password=osiris")

cursor = conn.cursor()

cursor.execute("SELECT * from Product")

rows = cursor.fetchall()

for row in rows:
	print(row)

cursor.close()
conn.close()
