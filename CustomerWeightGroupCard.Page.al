page 50101 "Customer Weight Group Page"
{
    PageType = Card;
    ApplicationArea = All;    
    SourceTable = "Customer Weight Group";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Customer Weight Group Code"; Rec.Code)
                {
                    ApplicationArea = All;                    
                }

                field("Customer Weight Group Description"; Rec.Description)
                {
                    ApplicationArea = All;                    
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }  
}