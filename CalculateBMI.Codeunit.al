codeunit 50101 CalculateBMI
{
    trigger OnRun()        
    begin        
    end;

    procedure CalculateBMI(Weight: Decimal; Height: Decimal) : Decimal    
    begin
       exit(Weight / Power(Height, 2));                
    end;
}