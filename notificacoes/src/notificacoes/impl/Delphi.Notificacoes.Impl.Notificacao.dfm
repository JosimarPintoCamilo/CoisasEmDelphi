object Notificacao: TNotificacao
  Left = 781
  Top = 0
  Cursor = crHandPoint
  BorderStyle = bsNone
  Caption = 'Notificacao'
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
  OnMouseEnter = FormMouseEnter
  OnMouseLeave = FormMouseLeave
  PixelsPerInch = 96
  TextHeight = 13
  object LMensagem: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 20
    Width = 371
    Height = 47
    Cursor = crHandPoint
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
    OnMouseEnter = FormMouseEnter
    OnMouseLeave = FormMouseLeave
    ExplicitWidth = 108
    ExplicitHeight = 25
  end
  object LIcone: TLabel
    Left = 23
    Top = 20
    Width = 84
    Height = 27
    Margins.Left = 10
    Alignment = taCenter
    Caption = 'LIcone'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Font Awesome 5 Free Solid'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TempoEmTela: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = TempoEmTelaTimer
    Left = 320
    Top = 16
  end
end
