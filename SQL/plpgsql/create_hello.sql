CREATE OR REPLACE FUNCTION hello() RETURNS varchar AS $$
<< outerblock >>
DECLARE
    greetings varchar := 'Hello PL/pgSQL !';
BEGIN
    RAISE NOTICE 'From hello() : %', greetings;
    greetings := 'Bye !';
    RAISE NOTICE 'From hello() : %', greetings;

    RETURN greetings;
END;
$$ LANGUAGE plpgsql;
