page 50102 "My Journal Line"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;    
    SourceTable = "My Journal2";
    
    layout
    {
        area(Content)
        {            
            repeater("Customer Weight Group Journal")
            {
                field(EntryNo;Rec.EntryNo)
                {     
                    ApplicationArea = All;           
                }
                field(CustomerNo;Rec.CustomerNo)
                {
                    ApplicationArea = All;
                }
                field(CustomerName;Rec.CustomerName)
                {
                    ApplicationArea = All;
                }
                field("Customer Weight Group";Rec."Customer Weight Group")
                {
                    ApplicationArea = All;
                }
                field(Height;Rec.Height)
                {
                    ApplicationArea = All;
                }
                field(Weight;Rec.Weight)
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
            action("Suggest Customers")
            {
                ApplicationArea = All;
                RunObject = report WorksheetReport;
                
                trigger OnAction()
                begin                    
                end;
            }

            action("Post values")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    MyJournal: Record "My Journal2";
                begin
                    if MyJournal.FindFirst() then
                    repeat
                        Customer.Get(MyJournal.CustomerNo);
                        Customer.Height:= MyJournal.Height;
                        Customer.Weight:= MyJournal.Weight;
                        Customer.CustomerWeightGroup:= MyJournal."Customer Weight Group";
                        Customer.Modify();
                    until (MyJournal.Next = 0);
                end;
            }

            action("Delete")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    MyJournal: Record "My Journal2";
                begin
                    MyJournal.DeleteAll();
                end;                
            }
        }
    }
}