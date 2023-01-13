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
                    ToolTip = 'Specifies the customer weight.';                
                }

                field(Height; Rec.Height)
                {
                    ApplicationArea = All;
                    Caption = 'Height';
                    ToolTip = 'Specifies the customer height.';
                }

                field(CustomerWeightGroup; Rec.CustomerWeightGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Weight Group';
                    ToolTip = 'Specifies the group of weight that the customer is in.';
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
                ToolTip = 'Calculate the body mass index of customer.';
                
                trigger OnAction()
                var
                    Calculate: Codeunit CalculateBMI;
                    BMI: Decimal;                                               
                begin                                       
                    BMI := Calculate.CalculateBMI(Rec.Weight, Rec.Height);
                    Message('The Body Mass Index is: %1', BMI);
                end;
            }
        }
    }       
}