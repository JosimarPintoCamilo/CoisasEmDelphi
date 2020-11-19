unit Notificacoes.Notificacoes.Impl.Notificacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Vcl.ExtCtrls,

  EventBus,
  EventBus.Attributes,

  Notificacoes.Notificacoes.Notificacao,
  Notificacoes.Eventos.EventosUtils;

type

  TNotificacao = class(TForm, INotificacao)
    LMensagem: TLabel;
    TempoEmTela: TTimer;
    LIcone: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TempoEmTelaTimer(Sender: TObject);

  private

    FCodigoIcone: Integer;
    FCor: TColor;
    FMensagem: string;

    procedure DefinirPosicaoInicialDoAlerta;
    procedure IniciarTimer;
    procedure RegistrarClasseParaReceberEventos;
    procedure RemoverAlertaParaDireita;

  public

    [Subscribe]
    procedure AtualizarTopAlert(Evento: TAtualizarTopAlert);

    function Mensagem(const Mensagen: string): INotificacao;
    function Icone(const CodigoIcone: Integer): INotificacao;
    function Cor(const Cor: TColor): INotificacao;
    class function New: INotificacao;

    procedure Exibir;
  end;

implementation

{$R *.dfm}

procedure TNotificacao.FormCreate(Sender: TObject);
begin
  DefinirPosicaoInicialDoAlerta;

  IniciarTimer;

  RegistrarClasseParaReceberEventos;
end;

procedure TNotificacao.AtualizarTopAlert(Evento: TAtualizarTopAlert);
begin
  Evento.Free;
  Self.Top := Self.Top + Self.Height + 10;
end;

function TNotificacao.Cor(const Cor: TColor): INotificacao;
begin
  Result := Self;
  FCor := Cor;
  Self.Color := FCor;
end;

procedure TNotificacao.DefinirPosicaoInicialDoAlerta;
begin
  Self.Position := PoDesigned;
  Self.Top := Screen.PrimaryMonitor.Top - Self.Height;
  Self.Left := Screen.PrimaryMonitor.Width - Self.Width - 10;
end;

procedure TNotificacao.Exibir;
begin
  Self.Show;
  TEventBus.GetDefault.Post(TAtualizarTopAlert.Create);
end;

function TNotificacao.Icone(const CodigoIcone: Integer): INotificacao;
begin
  Result := Self;
  FCodigoIcone := CodigoIcone;
  LIcone.Caption := WideChar(FCodigoIcone);
end;

procedure TNotificacao.IniciarTimer;
begin
  TempoEmTela.Enabled := True;
end;

function TNotificacao.Mensagem(const Mensagen: string): INotificacao;
begin
  Result := Self;
  FMensagem := Mensagen;
  LMensagem.Caption := FMensagem;
end;

class function TNotificacao.New: INotificacao;
begin
  Result := Self.Create(nil);
end;

procedure TNotificacao.RegistrarClasseParaReceberEventos;
begin
  TEventBus.GetDefault.RegisterSubscriber(Self);
end;

procedure TNotificacao.TempoEmTelaTimer(Sender: TObject);
begin
  RemoverAlertaParaDireita;

  TEventBus.GetDefault.Unregister(Self);
  Free;
end;

procedure TNotificacao.RemoverAlertaParaDireita;
var
  I: Byte;
begin
  for I := 1 to Self.Width do
  begin
    Self.Left := Self.Left + I;
  end;
end;

end.
