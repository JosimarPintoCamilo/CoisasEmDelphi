unit Delphi.Notificacoes.NotificacaoFactory;

interface

uses
  Delphi.Notificacoes.Notificacao;

type
  INotificacaoFactory = interface
    ['{CBE7A5D3-FE87-44CA-9E1E-488F28CAED99}']

    procedure Informacao(const Mensagem: string);
    procedure Warning(const Mensagem: string);
    procedure Erro(const Mensagem: string);
    procedure Sucesso(const Mensagem: string);
    procedure Dark(const Mensagem: string);

    procedure AdicionarNotificacao(const Notificacao: INotificacao);
    procedure RemoverNotificacao(const Notificacao: INotificacao);
    procedure Notificar;

  end;

implementation

end.
