import psycopg2

class DataConsumer():
	"""To query database"""
	def __init__(self, credentials):
		self.conn = psycopg2.connect(credentials)

	def __del__(self):
		self.conn.close()

	def getProductSet(self):
		cursor = self.conn.cursor()

		cursor.execute("SELECT * from Product")

		rows = cursor.fetchall()

		cursor.close()

		return rows
