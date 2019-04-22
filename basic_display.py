from model.product import Product
from model.ord import Ord

class BasicDisplay():
    def product(self, p):
        print(p.id ,':', p.name)

    def productList(self, pList):
        for pRaw in pList:
            p = Product(pRaw)
            self.product(p)

    def bookOrder(self, b):
        print(b.id, ':', b.date)

    def bookOrderList(self, bList):
        for bRaw in bList:
            b = Ord(bRaw)
            self.bookOrder(b)
