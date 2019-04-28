class Warehouse():
    """Bean for a warehouse with its address"""
    def __init__(self, raw):
        (self.id, self.number, self.name, self.city) = raw
