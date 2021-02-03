object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Notifica'#231#245'es em Delphi'
  ClientHeight = 515
  ClientWidth = 460
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 515
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 0
    StyleElements = []
    DesignSize = (
      460
      515)
    object Panel2: TPanel
      Left = 92
      Top = 64
      Width = 272
      Height = 62
      Cursor = crHandPoint
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Notifica'#231#227'o Dark'
      Color = 1184274
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 92
      Top = 393
      Width = 272
      Height = 62
      Cursor = crHandPoint
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Notifica'#231#227'o de Informa'#231#227'o'
      Color = 14391348
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 92
      Top = 309
      Width = 272
      Height = 62
      Cursor = crHandPoint
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Notifica'#231#227'o de Sucesso'
      Color = 834567
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 92
      Top = 226
      Width = 272
      Height = 62
      Cursor = crHandPoint
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Notifica'#231#227'o de Aten'#231#227'o'
      Color = 1033457
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 92
      Top = 146
      Width = 272
      Height = 62
      Cursor = crHandPoint
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Notifica'#231#227'o de Erro'
      Color = 3951847
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = Panel6Click
    end
  end
end
