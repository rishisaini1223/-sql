DECLARE
    cursor emp_cur is select * from emp_cp; -- cursor created explicit
    emp_record emp_cp%rowtype; -- record variable as same as of the table


BEGIN

    for line in emp_cur loop
        dbms_output.PUT_line(line.employee_id);
    end loop;


    -- this for while loop

    -- open emp_cur;  -- opened cursor
    -- fetch  emp_cur into emp_record;

 
    -- while emp_cur%found loop  
    --     DBMS_OUTPUT.PUT_LINE(emp_record.employee_id);
    --     fetch emp_cur into emp_record;

    -- end loop;
    -- close emp_cur; 
end; 
    

    -- what is difference bt store proceger and function.
    -- in parameter,out,inout patameter