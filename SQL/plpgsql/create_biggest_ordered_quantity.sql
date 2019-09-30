CREATE OR REPLACE FUNCTION biggest_ordered_quantity() RETURNS INTEGER AS 
$$
DECLARE
    ans INTEGER;
BEGIN
    SELECT ori_quantity FROM OrderedItem WHERE ori_id = 1 INTO ans;

    RETURN ans;
END;
$$
LANGUAGE plpgsql;
