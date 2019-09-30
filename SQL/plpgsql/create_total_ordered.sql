CREATE OR REPLACE FUNCTION total_ordered() RETURNS INTEGER language 'plpgsql' AS
$BODY$
DECLARE
    ans INTEGER;
BEGIN
    SELECT SUM(ori_quantity) FROM OrderedItem INTO ans;
    RETURN ans;
END;
$BODY$
;
