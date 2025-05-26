CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER
AS $$
DECLARE
    prev INTEGER := 0;
    curr INTEGER := 1;
BEGIN
    IF pstop <= 0 THEN
        RETURN;  
    END IF;

    WHILE curr < pstop
    LOOP
        RETURN NEXT curr;

        curr := prev + curr;
        prev := curr - prev;
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql;
