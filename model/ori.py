class Ori():
    """Bean for an ordered item"""
    def __init__(self, raw):
        (self.id, self.quantity, self.deliveryDueDate, self.pro_id, self.ord_id, self.war_id) = raw
