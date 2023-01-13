page 50101 "Customer Weight Group Page"
{
    PageType = List;
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
                    ToolTip = 'Specifies the code of customer weight group.';                    
                }

                field("Customer Weight Group Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of customer weight group.';                    
                }
            }
        }
    }
}