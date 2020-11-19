unit AtualizacoesAutomaticas.Model.Entity.Impl.Migrate;

interface

uses
  AtualizacoesAutomaticas.Model.Entity.Migrate;

type
  TMigrate = class(TInterfacedObject, IMigrate)
  private
    FId: string;
    function GetId: string;
    procedure SetId(const Value: string);
  public
    property Id: string read GetId write SetId;
  end;

implementation

function TMigrate.GetId: string;
begin
  Result := FId;
end;

procedure TMigrate.SetId(const Value: string);
begin
  FId := Value;
end;

end.
