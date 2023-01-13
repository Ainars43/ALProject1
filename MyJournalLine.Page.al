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
                    ToolTip = 'Specifies a number of entry.';           
                }
                field(CustomerNo;Rec.CustomerNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a number of customer.';
                }
                field(CustomerName;Rec.CustomerName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a name of customer.';
                }
                field("Customer Weight Group";Rec."Customer Weight Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the group of weight that the customer is in.';
                }
                field(Height;Rec.Height)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer height.';
                }
                field(Weight;Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer weight.';
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
                ToolTip = 'Suggest customers to add to journal.';
                
                trigger OnAction()
                begin                    
                end;
            }

            action("Post values")
            {
                ApplicationArea = All;
                ToolTip = 'Post changes in customers records.';

                trigger OnAction()
                var
                    Customer: Record Customer;
                    MyJournal: Record "My Journal2";
                begin
                    if MyJournal.FindSet() then
                    repeat
                        Customer.Get(MyJournal.CustomerNo);
                        Customer.Height := MyJournal.Height;
                        Customer.Weight := MyJournal.Weight;
                        Customer.CustomerWeightGroup := MyJournal."Customer Weight Group";
                        Customer.Modify();
                    until MyJournal.Next() = 0;
                end;
            }

            action("Delete")
            {
                ApplicationArea = All;
                ToolTip = 'Delete entries from journal which are posted to customer records.';

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