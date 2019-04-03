import psycopg2

conn = psycopg2.connect("host=myHost dbname=myDB user=xxx password=yyy")

cursor = conn.cursor()

cursor.execute("SELECT * from person")

rows = cursor.fetchall()

for row in rows:
	print(row)

cursor.close()
conn.close()