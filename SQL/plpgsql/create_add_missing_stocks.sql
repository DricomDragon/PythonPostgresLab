CREATE OR REPLACE FUNCTION add_missing_stocks() RETURNS void AS
$$
DECLARE
    proCursor CURSOR IS SELECT pro_id FROM Product;
    proId Product.pro_id%TYPE;
BEGIN
    RAISE NOTICE 'Bonjour';
END;
$$
LANGUAGE plpgsql;
