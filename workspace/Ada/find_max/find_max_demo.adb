with Text_IO; use Text_IO;
procedure Find_Max_Demo is
    c: Integer;

    procedure Find_Max(a, b: in Integer; 
                        c: out Integer) is
    begin
        if a > b then
            c:=a;
        else
            c:=b;
        end if;
    end;
    
begin
    Find_Max(20, 40, c);
    Put_Line("Max(20, 40): " & Integer'Image(c));
end;