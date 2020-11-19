program AtualizacoesAutomaticas;

uses
  Vcl.Forms,
  AtualizacoesAutomaticas.Views.AtualizacoesView in '..\src\views\AtualizacoesAutomaticas.Views.AtualizacoesView.pas' {Form1},
  AtualizacoesAutomaticas.Model.Repository.AtualizadorBancoDadosRepository in '..\src\model\repository\AtualizacoesAutomaticas.Model.Repository.AtualizadorBancoDadosRepository.pas',
  AtualizacoesAutomaticas.Model.Repository.Impl.AtualizadorBancoDadosRepository in '..\src\model\repository\impl\AtualizacoesAutomaticas.Model.Repository.Impl.AtualizadorBancoDadosRepository.pas',
  AtualizacoesAutomaticas.Model.Entity.Migrate in '..\src\model\entity\AtualizacoesAutomaticas.Model.Entity.Migrate.pas',
  AtualizacoesAutomaticas.Model.Entity.Impl.Migrate in '..\src\model\entity\impl\AtualizacoesAutomaticas.Model.Entity.Impl.Migrate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
