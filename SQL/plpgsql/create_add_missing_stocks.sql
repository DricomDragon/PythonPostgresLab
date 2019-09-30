CREATE OR REPLACE FUNCTION add_missing_stocks() RETURNS void AS
$$
DECLARE
    proCursor CURSOR IS SELECT pro_id FROM Product;
    proId Product.pro_id%TYPE;
BEGIN
    RAISE NOTICE 'Start';
    FOR k IN 1..10 LOOP
        RAISE NOTICE 'Loop %', k;
    END LOOP;
    RAISE NOTICE 'End';
END;
$$
LANGUAGE plpgsql;
