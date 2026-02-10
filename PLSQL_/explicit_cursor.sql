DECLARE
    cursor emp_cur is select * from emp_cp; -- cursor created explicit
    emp_record emp_cp%rowtype; -- record variable as same as of the table


BEGIN
    open emp_cur;  -- opened cursor
    fetch  emp_cur into emp_record;

    if emp_cur%isopen THEN -- is cursor open => true otherwise false
        DBMS_OUTPUT.PUT_LINE('cursor open');

    end if;

    if emp_cur%found then  -- True(based on fetch output)
        DBMS_OUTPUT.PUT_LINE('cursor got the data');
    else 
        DBMS_OUTPUT.PUT_LINE('cursor not found data');
    end if;
    close emp_cur; -- close the  cursor here
end; 
    