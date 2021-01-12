object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa3'
  ClientHeight = 320
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 474
    Height = 13
    Align = alTop
    Caption = 'Valores por projeto:'
    ExplicitWidth = 96
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 22
    Width = 474
    Height = 189
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 217
    Width = 474
    Height = 100
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      474
      100)
    object Label2: TLabel
      Left = 360
      Top = 5
      Width = 44
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total R$:'
    end
    object Label3: TLabel
      Left = 360
      Top = 49
      Width = 85
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total divis'#245'es R$:'
    end
    object edtTotal: TEdit
      Left = 360
      Top = 23
      Width = 100
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object edtTotalDivisoes: TEdit
      Left = 360
      Top = 67
      Width = 100
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object butObterTotal: TButton
      Left = 230
      Top = 23
      Width = 120
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Obter Total'
      TabOrder = 2
      OnClick = butObterTotalClick
    end
    object butObterTotalDivisoes: TButton
      Left = 230
      Top = 67
      Width = 120
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 3
      OnClick = butObterTotalDivisoesClick
    end
  end
end
