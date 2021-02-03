unit Notificacoes.Notificacoes.Impl.Notificacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Vcl.ExtCtrls,

  Notificacoes.Notificacoes.Notificacao;

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
    FOnRemoverDaLista: TRemoverDaLista;

    procedure SetOnRemoverDaLista(const Value: TRemoverDaLista);
    procedure DefinirPosicaoInicialDoAlerta;
    procedure IniciarTimer;

  public
    class function New: INotificacao;

    function Mensagem(const Mensagen: string): INotificacao;
    function Icone(const CodigoIcone: Integer): INotificacao;
    function Cor(const Cor: TColor): INotificacao;

    procedure AtualizarPosicao;
    procedure Exibir;
    property OnRemoverDaLista: TRemoverDaLista write SetOnRemoverDaLista;
  end;

implementation

{$R *.dfm}

procedure TNotificacao.FormCreate(Sender: TObject);
begin
  DefinirPosicaoInicialDoAlerta;
end;

function TNotificacao.Cor(const Cor: TColor): INotificacao;
begin
  Result := Self;
  FCor := Cor;
  Self.Color := FCor;
end;

function TNotificacao.Icone(const CodigoIcone: Integer): INotificacao;
begin
  Result := Self;
  FCodigoIcone := CodigoIcone;
  LIcone.Caption := WideChar(FCodigoIcone);
end;

function TNotificacao.Mensagem(const Mensagen: string): INotificacao;
begin
  Result := Self;
  FMensagem := Mensagen;
  LMensagem.Caption := FMensagem;
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
  IniciarTimer;
end;

procedure TNotificacao.IniciarTimer;
begin
  TempoEmTela.Enabled := True;
end;

procedure TNotificacao.TempoEmTelaTimer(Sender: TObject);
begin
  if Assigned(FOnRemoverDaLista) then
    FOnRemoverDaLista(Self);
  Free;
end;

procedure TNotificacao.AtualizarPosicao;
begin
  Self.Top := Self.Top + Self.Height + 10;
end;

class function TNotificacao.New: INotificacao;
begin
  Result := Self.Create(nil);
end;

procedure TNotificacao.SetOnRemoverDaLista(const Value: TRemoverDaLista);
begin
  FOnRemoverDaLista := Value;
end;

end.
