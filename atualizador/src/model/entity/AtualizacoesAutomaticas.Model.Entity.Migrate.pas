unit AtualizacoesAutomaticas.Model.Entity.Migrate;

interface

type
  IMigrate = interface
    ['{F18D6947-C6A7-4F97-A501-B9FF05663E72}']
    function GetId: string;
    procedure SetId(const Value: string);
    property Id: string read GetId write SetId;

  end;

implementation

end.
