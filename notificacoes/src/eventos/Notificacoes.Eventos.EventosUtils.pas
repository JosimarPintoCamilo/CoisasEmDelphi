unit Notificacoes.Eventos.EventosUtils;

interface

type
  IAtualizarTopNotificacao = interface(IInterface)
    ['{EE9058BB-EA54-4851-A4BE-E6EFF49732B7}']
  end;

  TAtualizarTopNotificacao = class(TInterfacedObject, IAtualizarTopNotificacao)
  public
    constructor Create;
  end;

implementation

constructor TAtualizarTopNotificacao.Create;
begin
end;

end.
