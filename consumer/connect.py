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

    def addProduct(self, name): 
        cursor = self.conn.cursor()

        cursor.execute("INSERT INTO Product (pro_name) VALUES (%s)", (name,))

        cursor.close()

    def getCompanyNames(self):
        cursor = self.conn.cursor()

        cursor.execute("SELECT com_name FROM Company")

        ans = []
        for t in cursor:
            ans.append(t[0])

        cursor.close()

        return ans

    def getOrdersOfCompany(self, company):
        cursor = self.conn.cursor()

        cursor.execute("SELECT ord_id, ord_date FROM bookorder NATURAL JOIN company WHERE com_name = %s", (company,))

        rows = cursor.fetchall()

        cursor.close()

        return rows

    def getItemsOfOrder(self, bookId):
        cursor = self.conn.cursor()

        cursor.execute("SELECT ori_id, ori_quantity, pro_name, ori_deliveryduedate FROM ordereditem NATURAL JOIN product WHERE ord_id = %s", (bookId,))

        rows = cursor.fetchall()

        cursor.close()

        return rows
        
    def getWarehousesOfCompany(self, company):
        cursor = self.conn.cursor()

        cursor.execute("SELECT war_id, add_number, add_name, add_city FROM warehouse AS w JOIN company AS c ON w.com_id = c.com_id JOIN postaladdress AS p ON w.add_id = p.add_id WHERE com_name = %s", (company,))

        rows = cursor.fetchall()

        cursor.close()

        return rows

    def addOrder(self, company, houseId, proIdList, proQuantityList, dueDate):

        # Debug : work under progress
        print('add order not implemented yet')
        print(company)
        print(houseId)
        print(proIdList)
        print(proQuantityList)
        print(dueDate)
        
        # Create cursor to execute SQL statements
        cursor = self.conn.cursor()

        # Create book order
        cursor.execute("INSERT INTO bookorder(ord_date, com_id) SELECT %s, com_id FROM company WHERE com_name = %s", (dueDate, company))

        # Retrieve id of the newly created bookorder
        cursor.execute("SELECT CURRVAL('bookorder_ord_id_seq')")
        ordId = cursor.fetchone()[0]

        # Add ordered items
        for k in range(len(proIdList)):
            proName = proIdList[k]
            proQuantity = proQuantityList[k]
            cursor.execute("INSERT INTO ordereditem(ori_quantity, ori_deliveryduedate, pro_id, ord_id, war_id) SELECT %s, %s, pro_id, %s, %s FROM product WHERE pro_name = %s", (proQuantity, dueDate, ordId, houseId, proName))
        cursor.close()


    def commit(self):
        """Make the changes to the database persistent"""
        self.conn.commit()
