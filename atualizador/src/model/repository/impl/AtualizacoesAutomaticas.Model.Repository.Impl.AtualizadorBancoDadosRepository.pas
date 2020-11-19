unit AtualizacoesAutomaticas.Model.Repository.Impl.AtualizadorBancoDadosRepository;

interface

uses
  SQLiteTable3,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Adapters.SQLite,
  AtualizacoesAutomaticas.Model.Repository.AtualizadorBancoDadosRepository;

type
  TAtualizadorBancoDadosRepository = class(TInterfacedObject, IAtualizadorBancoDadosRepository)
  private
    FConnection: IDBConnection;
    FDatabase: TSQLiteDatabase;
    FSession: TSession;
  public
    constructor Create;
    function MigrateExecutada(const Id: string): Boolean;
    procedure Atualizar;
    class function New: IAtualizadorBancoDadosRepository;
  end;

implementation

uses
  AtualizacoesAutomaticas.Model.Entity.Impl.Migrate;

constructor TAtualizadorBancoDadosRepository.Create;
begin
  FDatabase := TSQLiteDatabase.Create;
  FDatabase.Filename := 'products.db3';
  FConnection := TSQLiteConnectionAdapter.Create(FDatabase);

  FConnection.AutoFreeConnection := True;
  FConnection.Connect;
  FSession := TSession.Create(FConnection);
end;

class function TAtualizadorBancoDadosRepository.New: IAtualizadorBancoDadosRepository;
begin
  Result := Self.Create;
end;

function TAtualizadorBancoDadosRepository.MigrateExecutada(const Id: string): Boolean;
begin
  Result := not FSession.FindOne <TMigrate> (Id).Equals(nil);
end;

procedure TAtualizadorBancoDadosRepository.Atualizar;
begin

end;

end.
