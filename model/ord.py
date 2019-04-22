class Ord():
    """Bean for a book order"""
    def __init__(self, raw):
        (self.id, self.date, self.com_id) = raw
