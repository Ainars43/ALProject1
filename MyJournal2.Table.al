table 50103 "My Journal2"
{
    Caption = 'My Journal2';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No';
            AutoIncrement = true;
        }

        field(2; CustomerNo; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No';
        }

        field(3; CustomerName; Text[100])
        {            
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup (Customer.Name where ("No." = field (CustomerNo)));
        }

        field(4; "Customer Weight Group"; Text[120])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Weight Group';
        }

        field(5; Height; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Height';
        }

        field(6; Weight; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Weight';
        }        
    }
    
    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
}