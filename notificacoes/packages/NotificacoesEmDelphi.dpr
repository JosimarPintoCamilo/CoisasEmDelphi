program NotificacoesEmDelphi;

uses
  Vcl.Forms,
  viewPrinciapal in '..\src\viewPrinciapal.pas' {Form1},
  Notificacoes.Notificacoes.Impl.Notificacao in '..\src\notificacoes\impl\Notificacoes.Notificacoes.Impl.Notificacao.pas' {Notificacao},
  Notificacoes.Eventos.EventosUtils in '..\src\eventos\Notificacoes.Eventos.EventosUtils.pas',
  Notificacoes.Notificacoes.Notificacao in '..\src\notificacoes\Notificacoes.Notificacoes.Notificacao.pas',
  Notificacoes.Notificacoes.NotificacaoFactory in '..\src\notificacoes\Notificacoes.Notificacoes.NotificacaoFactory.pas',
  Notificacoes.Notificacoes.Impl.NotificacaoFactory in '..\src\notificacoes\impl\Notificacoes.Notificacoes.Impl.NotificacaoFactory.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
