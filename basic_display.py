from model.product import Product
from model.ord import Ord
from model.ori import Ori
from model.house import Warehouse

class BasicDisplay():
    def title(self, title):
        n = len(title) + 2
        bar = '+' + '-' * n + '+'
        print(bar)
        print('|', title, '|')
        print(bar)

    def error(self, *message):
        print('ERROR :', *message)

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

    def warehouse(self, w):
        print('Warehouse', w.id, ':', w.number, w.name, ',', w.city)

    def warehouseList(self, wList):
        for wRaw in wList:
            w = Warehouse(wRaw)
            self.warehouse(w)
