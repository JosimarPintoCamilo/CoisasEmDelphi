object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 317
  ClientWidth = 606
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 168
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 59
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 80
    Top = 131
    Width = 393
    Height = 17
    TabOrder = 1
  end
  object IdFTPAtualizacoes: TIdFTP
    OnWork = IdFTPAtualizacoesWork
    OnWorkBegin = IdFTPAtualizacoesWorkBegin
    IPVersion = Id_IPv4
    Host = 'atualizacao-automatica.orgfree.com'
    Passive = True
    ConnectTimeout = 0
    Password = 'q-iX7N9hUDgP68c'
    TransferType = ftBinary
    Username = 'atualizacao-automatica.orgfree.com'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 136
    Top = 32
  end
end
