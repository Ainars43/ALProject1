table 50101 "Customer Weight Group"
{
    Caption = 'Customer Weight Group';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Text[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;            
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;            
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}