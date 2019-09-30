CREATE OR REPLACE FUNCTION add_missing_stocks() RETURNS void AS
$$
DECLARE
    proCursor CURSOR FOR SELECT pro_id FROM Product;
    proId Product.pro_id%TYPE;

    warCursor CURSOR FOR SELECT war_id FROM Warehouse;
    warId Warehouse.war_id%TYPE;

    stoCursor CURSOR FOR SELECT sto_quantity FROM Stock WHERE pro_id = proId AND war_id = warId;
    stoQuantity Stock.sto_quantity%TYPE;
BEGIN
    RAISE NOTICE 'Start';

    -- Iterate on products
    OPEN proCursor;
    LOOP
        FETCH proCursor INTO proId;
        EXIT WHEN proId IS NULL;

        -- Iterate on warehouses
        OPEN warCursor;
        LOOP
            FETCH warCursor INTO warId;
            EXIT WHEN warId IS NULL;

            -- Find associated storage
            OPEN stoCursor;
            FETCH stoCursor INTO stoQuantity;
            IF stoQuantity IS NULL
            THEN
                RAISE NOTICE 'Pro % for war % not available', proId, warId;
                INSERT INTO Stock(pro_id, war_id) VALUES (proId, warId);
                RAISE NOTICE '- Pro % for war % was inserted', proId, warId;
            ELSE 
                RAISE NOTICE 'Pro % for war % stores %', proId, warId, stoQuantity;
            END IF;
            CLOSE stoCursor;
            
        END LOOP;
        CLOSE warCursor;
    END LOOP;
    CLOSE proCursor;
    RAISE NOTICE 'End';
END;
$$
LANGUAGE plpgsql;
