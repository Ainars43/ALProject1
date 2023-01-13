tableextension 50100 CustomerExtension extends Customer
{
    fields
    {
        field(50100; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = CustomerContent;            
        }

        field(50101; Height; Decimal)
        {
            Caption = 'Height';
            DataClassification = CustomerContent;            
        }

        field(50102; CustomerWeightGroup; Text[120])
        {
            Caption = 'Customer Weight Group';
            DataClassification = CustomerContent;
            TableRelation = "Customer Weight Group";
        }
    }
}