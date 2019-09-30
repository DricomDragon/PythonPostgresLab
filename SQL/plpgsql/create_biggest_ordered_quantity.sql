CREATE OR REPLACE FUNCTION biggest_ordered_quantity() RETURNS OrderedItem AS 
$$
DECLARE
    ans OrderedItem;
BEGIN
    SELECT * FROM OrderedItem ORDER BY ori_quantity DESC INTO ans;

    RETURN ans;
END;
$$
LANGUAGE plpgsql;
