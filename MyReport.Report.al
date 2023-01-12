report 50100 MyReport
{
    Caption = 'MyReport';
    RDLCLayout = 'layouts/MyReport.rdl';
    WordLayout = 'layouts/MyReport.docx';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;      
    DefaultLayout = Word;
    PreviewMode = Normal;    
    
    dataset
    {
        dataitem(ListOfCustomersWithBMI; Customer)
        {
            DataItemTableView = SORTING("No.");
            //RequestFilterFields = "Height", "Weight";

            column(No; "No." )
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

            column(BMI; BMI)
            {                
            }

            trigger OnPreDataItem()            
            begin
                SetFilter(Height, '>0');
                SetFilter(Weight, '>0');                
            end;

            // trigger OnPreDataItem()            
            // begin
            //     SetRange(Height, 0.1, 100);
            //     SetRange(Weight, 0.1, 100);                
            // end;
 
            // trigger OnAfterGetRecord()
            // var
            //     CalculateBMI: Codeunit CalculateBMI;
            // begin
            //     // if (Height = 0) OR (Weight = 0) then
            //     //     CurrReport.Skip();                

            //     if (Height > 0) AND (Weight > 0) then
            //         BMI := CalculateBMI.CalculateBMI(Weight, Height);
            // end;

            trigger OnAfterGetRecord()
            var
                CalculateBMI: Codeunit CalculateBMI;
            begin                
                BMI := CalculateBMI.CalculateBMI(Weight, Height);
            end;                 
        }
    }

    var
        BMI: Decimal;        
}