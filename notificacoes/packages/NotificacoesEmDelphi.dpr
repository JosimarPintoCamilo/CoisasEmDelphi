program NotificacoesEmDelphi;

uses
  Vcl.Forms,
  viewPrinciapal in '..\src\viewPrinciapal.pas' {Form1},
  Delphi.Notificacoes.Impl.Notificacao in '..\src\notificacoes\impl\Delphi.Notificacoes.Impl.Notificacao.pas' {Notificacao},
  Delphi.Notificacoes.Notificacao in '..\src\notificacoes\Delphi.Notificacoes.Notificacao.pas',
  Delphi.Notificacoes.NotificacaoFactory in '..\src\notificacoes\Delphi.Notificacoes.NotificacaoFactory.pas',
  Delphi.Notificacoes.Impl.NotificacaoFactory in '..\src\notificacoes\impl\Delphi.Notificacoes.Impl.NotificacaoFactory.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
