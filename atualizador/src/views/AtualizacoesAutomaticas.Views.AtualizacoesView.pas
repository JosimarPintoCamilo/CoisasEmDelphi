unit AtualizacoesAutomaticas.Views.AtualizacoesView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,

  IdException,
  IniFiles,
  ShellAPI;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    IdFTPAtualizacoes: TIdFTP;

    procedure BitBtn1Click(Sender: TObject);
    procedure IdFTPAtualizacoesWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure IdFTPAtualizacoesWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);

  private

    FTanhanhoTotalDownload: Integer;

    function ObterNumeroNovaVersao: Smallint;
    function ObterNumeroVersaoLocal: Smallint;

    function ArquivoAtualizacao: string;
    function ArquivoNovaVersao: string;
    function ArquivoVersaoAtual: string;

    function ConectarAoServidorFTP: Boolean;
    function ObterDiretorioDoExecutavel: string;
    function ExeBackup: string;
    function NomeDaAplicacao: string;

    procedure BaixarAtualizacao;
    procedure DescompactarAtualizacao;
    procedure AtualizarNumeroVersao;
    function PossuiAtualizacao: Boolean;
    procedure ReiniciarApicacao;

  end;

const
  ARQUIVO_VERSAO_ATUAL = 'versaoatual.ini';
  ARQUIVO_NOVA_VERSAO = 'novaversao.ini';
  ARQUIVO_ATUALIZACAO = 'atualizacao.rar';
  PASTA_ATUALIZACOES_SERVIDOR = 'atualizacoes/';
  NOME_DA_APLICACAO = 'AtualizacoesAutomaticas';

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.ArquivoAtualizacao: string;
begin
  Result := ObterDiretorioDoExecutavel + 'atualizacao.rar';
end;

function TForm1.ArquivoNovaVersao: string;
begin
  Result := ObterDiretorioDoExecutavel + ARQUIVO_NOVA_VERSAO;
end;

function TForm1.ArquivoVersaoAtual: string;
begin
  Result := ObterDiretorioDoExecutavel + ARQUIVO_VERSAO_ATUAL;
end;

procedure TForm1.AtualizarNumeroVersao;
var
  VersaoAtual, NovaVersao: TIniFile;
  NumeroNovaVersao: string;
begin
  VersaoAtual := TIniFile.Create(ArquivoVersaoAtual);
  NovaVersao := TIniFile.Create(ArquivoNovaVersao);

  try
    NumeroNovaVersao := NovaVersao.ReadString('versao', 'numero', EmptyStr);
    VersaoAtual.WriteString('versao', 'numero', NumeroNovaVersao);
  finally
    FreeAndNil(VersaoAtual);
    FreeAndNil(NovaVersao);
  end;
end;

procedure TForm1.BaixarAtualizacao;
begin

  if FileExists(ArquivoAtualizacao) then
    DeleteFile(ArquivoAtualizacao);
  try
    FTanhanhoTotalDownload := IdFTPAtualizacoes.Size(PASTA_ATUALIZACOES_SERVIDOR + ARQUIVO_ATUALIZACAO);

    IdFTPAtualizacoes.Get(PASTA_ATUALIZACOES_SERVIDOR + ARQUIVO_ATUALIZACAO, ArquivoAtualizacao, True, True);

  except
    on E: EIdConnClosedGracefully do

  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  VersaoAtual, NovaVersao: Smallint;
begin
  if not ConectarAoServidorFTP then
    Exit;

  if not PossuiAtualizacao then
    Exit;

  BaixarAtualizacao;
  DescompactarAtualizacao;
  AtualizarNumeroVersao;

  ReiniciarApicacao;
end;

function TForm1.ConectarAoServidorFTP: Boolean;
begin
  if IdFTPAtualizacoes.Connected then
    IdFTPAtualizacoes.Disconnect;

  try
    IdFTPAtualizacoes.Connect;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Error ao acessar o servidor ' + E.Message);
  end;
end;

procedure TForm1.DescompactarAtualizacao;
begin
  if FileExists(ExeBackup) then
    DeleteFile(ExeBackup);

  RenameFile(NomeDaAplicacao, ExeBackup);

  ShellExecute(0, nil, '7z', PWidechar(' e -aoa ' + ArquivoAtualizacao + ' -o' + ObterDiretorioDoExecutavel), '', SW_SHOW);

end;

function TForm1.ObterDiretorioDoExecutavel: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function TForm1.ExeBackup: string;
begin
  Result := ObterDiretorioDoExecutavel + NOME_DA_APLICACAO + '_backup.exe';
end;

procedure TForm1.IdFTPAtualizacoesWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  TamanhoTotal, Transmitidos, Porcentagem: Real;
begin
  if FTanhanhoTotalDownload = 0 then
    Exit;

  Application.ProcessMessages;

  // obtém o tamanho total do arquivo em bytes
  TamanhoTotal := FTanhanhoTotalDownload div 1024;

  // obtém a quantidade de bytes já baixados
  Transmitidos := AWorkCount div 1024;

  // calcula a porcentagem de download
  Porcentagem := (Transmitidos * 100) / TamanhoTotal;

  // atualiza o componente TLabel com a porcentagem
  Label1.Caption := Format('%s%%', [FormatFloat('##0', Porcentagem)]);

  // atualiza a barra de preenchimento do componente TProgressBar
  ProgressBar1.Position := AWorkCount div 1024;

end;

procedure TForm1.IdFTPAtualizacoesWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  ProgressBar1.Max := FTanhanhoTotalDownload div 1024;
end;

function TForm1.NomeDaAplicacao: string;
begin
  Result := Application.ExeName;
end;

function TForm1.ObterNumeroNovaVersao: Smallint;
var
  NumeroVersao: string;
  ArquivoNovaVersao: TIniFile;
  Teste: Integer;
begin
  if FileExists(ObterDiretorioDoExecutavel + ARQUIVO_NOVA_VERSAO) then
    DeleteFile(ObterDiretorioDoExecutavel + ARQUIVO_NOVA_VERSAO);
  try
    IdFTPAtualizacoes.Get('atualizacoes/novaversao.ini', ObterDiretorioDoExecutavel + 'novaversao.ini', True, False);
  except
    on E: EIdConnClosedGracefully do

  end;

  ArquivoNovaVersao := TIniFile.Create(ObterDiretorioDoExecutavel + ARQUIVO_NOVA_VERSAO);
  try
    NumeroVersao := ArquivoNovaVersao.ReadString('versao', 'numero', EmptyStr);
    NumeroVersao := StringReplace(NumeroVersao, '.', EmptyStr, [RfReplaceAll]);

    Result := NumeroVersao.ToInteger;
  finally
    FreeAndNil(ArquivoNovaVersao);
  end;
end;

function TForm1.ObterNumeroVersaoLocal: Smallint;
var
  NumeroVersao: string;
  ArquivoVersaoAtual: TIniFile;
begin
  ArquivoVersaoAtual := TIniFile.Create(ObterDiretorioDoExecutavel + 'versaoatual.ini');
  try
    NumeroVersao := ArquivoVersaoAtual.ReadString('versao', 'numero', EmptyStr);
    NumeroVersao := StringReplace(NumeroVersao, '.', EmptyStr, [RfReplaceAll]);

    Result := NumeroVersao.ToInteger;
  finally
    FreeAndNil(ArquivoVersaoAtual);
  end;

end;

function TForm1.PossuiAtualizacao: Boolean;
var
  VersaoAtual: Smallint;
  NovaVersao: Smallint;
begin
  VersaoAtual := ObterNumeroVersaoLocal;
  NovaVersao := ObterNumeroNovaVersao;

  Result := VersaoAtual < NovaVersao;
end;

procedure TForm1.ReiniciarApicacao;
begin
  ShellExecute(Handle, nil, PChar(Application.ExeName), '', nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

end.
