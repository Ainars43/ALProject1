report 50102 WorksheetReport
{
    Caption = 'Worksheet Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;    
    PreviewMode = Normal;
    ProcessingOnly = true;
    
    dataset
    {
        dataitem(WorksheetList; Customer)
        {
            PrintOnlyIfDetail = true;
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "CustomerWeightGroup";
            MaxIteration = 3;
            
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Height; Height)
            {
                IncludeCaption = true;
            }
            column(Weight; Weight)
            {
                IncludeCaption = true;
            }
            column(CustomerWeightGroup; CustomerWeightGroup)
            {
                IncludeCaption = true;
            }

            trigger OnPreDataItem()
            begin
                if ShowExceptCustomers then begin
                    SetFilter(Height, '=0');
                    SetFilter(Weight, '=0');
                end;                    
            end;

            trigger OnAfterGetRecord()
            var                
                MyRecord: Record "My Journal2";
            begin                
                MyRecord.Init();                
                MyRecord.CustomerNo:= "No.";
                MyRecord.CustomerName:= Name;                
                MyRecord.Insert(); 
            end;
        }
    }
    
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(ShowExceptCustomers; ShowExceptCustomers)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Only Customers Without Height And Weight Values?';
                    }
                }
            }
        }        
    }  

    var
        ShowExceptCustomers: Boolean;
}