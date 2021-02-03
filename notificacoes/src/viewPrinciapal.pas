unit viewPrinciapal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,

  Notificacoes.Notificacoes.Notificacao,
  Notificacoes.Notificacoes.NotificacaoFactory,
  Notificacoes.Notificacoes.Impl.NotificacaoFactory;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);

  private

    FNotificacaoFactory: INotificacaoFactory;
    FNotificacao: INotificacao;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FNotificacaoFactory := TNotificacaoFactory.New;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
  FNotificacaoFactory.Dark('Teessssssssste');
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  TNotificacaoFactory.New.Informacao('Uma informação');
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
  TNotificacaoFactory.New.Sucesso('Cadastrado com sucesso!');
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
  TNotificacaoFactory.New.Warning('Tome cuidado');
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
  TNotificacaoFactory.New.Erro('Deu Erro');
end;

end.
