object NotificacaoModelo: TNotificacaoModelo
  Left = 781
  Top = 0
  BorderStyle = bsNone
  Caption = 'NotificacaoModelo'
  ClientHeight = 70
  ClientWidth = 384
  Color = 14391348
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LMensagem: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 20
    Width = 371
    Height = 47
    Margins.Left = 10
    Margins.Top = 20
    Align = alClient
    Alignment = taCenter
    Caption = 'LMensagem'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
    StyleElements = []
    ExplicitWidth = 108
    ExplicitHeight = 25
  end
  object Icone: TLabel
    Left = 28
    Top = 22
    Width = 47
    Height = 20
    Caption = 'Icone'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Font Awesome 5 Free Regular'
    Font.Style = []
    ParentFont = False
  end
  object TempoEmTela: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TempoEmTelaTimer
    Left = 320
    Top = 16
  end
end
