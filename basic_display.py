from model.product import Product

class BasicDisplay():
    def product(self, p):
        print(p.id ,':', p.name)

    def productList(self, pList):
        for pRaw in pList:
            p = Product(pRaw)
            self.product(p)

