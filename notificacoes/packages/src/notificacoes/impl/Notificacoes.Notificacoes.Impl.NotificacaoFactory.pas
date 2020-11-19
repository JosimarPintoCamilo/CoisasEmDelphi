unit Notificacoes.Notificacoes.Impl.NotificacaoFactory;

interface

uses
  Notificacoes.Notificacoes.Impl.Notificacao,
  Notificacoes.Notificacoes.NotificacaoFactory;

type
  TNotificacaoFactory = class(TInterfacedObject, INotificacaoFactory)

  public

    constructor Create;
    class function New: INotificacaoFactory;

    procedure Informacao(const Mensagem: string);
    procedure Warning(const Mensagem: string);
    procedure Erro(const Mensagem: string);
    procedure Sucesso(const Mensagem: string);
    procedure Dark(const Mensagem: string);
  end;

const
  ICONE_NENHUM = $0;
  ICONE_ERRO = $F00D;
  ICONE_INFORMACAO = $F05A;
  ICONE_SUCESSO = $F058;
  ICONE_WARNING = $F06A;

  COR_PRETO = $00121212;
  COR_VERMELHO = $003C4CE7;
  COR_AZUL = $00DB9834;
  COR_VERDE = $000CBC07;
  COR_LARANJA = $000FC4F1;

implementation

constructor TNotificacaoFactory.Create;
begin
end;

class function TNotificacaoFactory.New: INotificacaoFactory;
begin
  Result := Self.Create;
end;

procedure TNotificacaoFactory.Dark(const Mensagem: string);
begin
  TNotificacao.New.Mensagem(Mensagem).Icone(ICONE_NENHUM).Cor(COR_PRETO).Exibir;
end;

procedure TNotificacaoFactory.Erro(const Mensagem: string);
begin
  TNotificacao.New.Mensagem(Mensagem).Icone(ICONE_ERRO).Cor(COR_VERMELHO).Exibir;
end;

procedure TNotificacaoFactory.Informacao(const Mensagem: string);
begin
  TNotificacao.New.Mensagem(Mensagem).Icone(ICONE_INFORMACAO).Cor(COR_AZUL).Exibir;
end;

procedure TNotificacaoFactory.Sucesso(const Mensagem: string);
begin
  TNotificacao.New.Mensagem(Mensagem).Icone(ICONE_SUCESSO).Cor(COR_VERDE).Exibir;
end;

procedure TNotificacaoFactory.Warning(const Mensagem: string);
begin
  TNotificacao.New.Mensagem(Mensagem).Icone(ICONE_WARNING).Cor(COR_LARANJA).Exibir;
end;

end.
