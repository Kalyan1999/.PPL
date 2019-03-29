with Text_IO;
use Text_IO;

procedure Continuation is
    type Age_Type is range 0..125;
    type Age_List_Type is array (1..4) of Age_Type;
    package AGE_IO is new Text_IO.Integer_IO (Age_Type);
    use Age_IO;
    Age_List: Age_List_Type;    
begin
    for Age_Count in 1..4 loop
        loop
        Except_Blk:
            begin
                Put_Line("Enter an Integer in range 1..125");
                Get(Age_List(Age_Count));
                exit;
            exception
                when Data_Error =>
                    Put_Line("Illegal numeric value");
                    Put_Line("Please try again");
                when Constraint_Error =>
                    Put_Line("Input number is out of range");
                    Put_Line("Please try again");
            end Except_Blk;
        end loop;
    end loop;
end Continuation;