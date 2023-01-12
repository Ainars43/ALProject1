pageextension 50100 CustomerCardExtension extends "Customer Card"
{    

    layout
    {
        addafter("Address & Contact")
        {
            group("Body Mass Index")
            {
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    Caption = 'Weight';                
                }

                field(Height; Rec.Height)
                {
                    ApplicationArea = All;
                    Caption = 'Height';
                }                
            }               
        }        
    }

    actions
    {
        addfirst(Navigation)
        {
            action("Calculate BMI")
            {
                ApplicationArea = All;
                RunObject = codeunit CalculateBMI;
                
                trigger OnAction()
                var
                    Calculate: Codeunit CalculateBMI;
                    BMI: Decimal;                                               
                begin                                       
                    BMI:= Calculate.CalculateBMI(Rec.Weight, Rec.Height);
                    Message('The Body Mass Index is: %1', BMI);
                end;
            }
        }
    }       
}