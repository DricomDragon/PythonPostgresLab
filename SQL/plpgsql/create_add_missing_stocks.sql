CREATE OR REPLACE FUNCTION add_missing_stocks() RETURNS void AS
$$
DECLARE
    proCursor CURSOR FOR SELECT pro_id FROM Product;
    proId Product.pro_id%TYPE;
BEGIN
    RAISE NOTICE 'Start';
    OPEN proCursor;
    LOOP
        FETCH proCursor INTO proId;
        EXIT WHEN proId IS NULL;
        RAISE NOTICE 'Loop %', proId;
    END LOOP;
    CLOSE proCursor;
    RAISE NOTICE 'End';
END;
$$
LANGUAGE plpgsql;
