CREATE OR REPLACE FUNCTION supply_every_stock(amount INTEGER) RETURNS void AS
$$
DECLARE
    stoCursor CURSOR IS SELECT sto_quantity FROM Stock FOR UPDATE;
    stoQuantity Stock.sto_quantity%TYPE;
BEGIN
    RAISE NOTICE 'Iterate on existing stocks only';

    -- Iterate on storage
    OPEN stoCursor;
    LOOP
        FETCH stoCursor INTO stoQuantity;
        EXIT WHEN stoQuantity IS NULL;

        RAISE NOTICE 'Supply %', amount;

        UPDATE Stock SET sto_quantity = sto_quantity + amount WHERE CURRENT OF stoCursor;
    END LOOP;
    CLOSE stoCursor;
    RAISE NOTICE 'End';
END;
$$
LANGUAGE plpgsql;
