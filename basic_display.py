from model.product import Product
from model.ord import Ord
from model.ori import Ori

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

    def orderedItem(self, i):
        print(i.id, ':', i.quantity, 'g of', i.name, 'dued', i.date)

    def orderedItemList(self, iList):
        for iRaw in iList:
            i = Ori(iRaw)
            self.orderedItem(i)
