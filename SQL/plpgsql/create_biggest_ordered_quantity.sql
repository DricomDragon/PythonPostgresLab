CREATE OR REPLACE FUNCTION biggest_ordered_quantity() RETURNS INTEGER AS 
$$
DECLARE
    ans INTEGER;
BEGIN
    SELECT ori_quantity FROM OrderedItem ORDER BY ori_quantity DESC INTO ans;

    RETURN ans;
END;
$$
LANGUAGE plpgsql;
