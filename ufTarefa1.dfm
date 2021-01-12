object fTarefa1: TfTarefa1
  Left = 5
  Top = 0
  Caption = 'Tarefa1'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object Label2: TLabel
    Left = 215
    Top = 10
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object Label3: TLabel
    Left = 425
    Top = 10
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object Label4: TLabel
    Left = 5
    Top = 133
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mmoColunas: TMemo
    Left = 5
    Top = 28
    Width = 205
    Height = 100
    Lines.Strings = (
      'id'
      'nome'
      'sobrenome'
      'nascimento')
    TabOrder = 0
  end
  object mmoTabelas: TMemo
    Left = 215
    Top = 28
    Width = 205
    Height = 100
    Lines.Strings = (
      'pessoa')
    TabOrder = 1
  end
  object mmoCondicoes: TMemo
    Left = 425
    Top = 28
    Width = 205
    Height = 100
    Lines.Strings = (
      'where id > 100'
      'and id < 200')
    TabOrder = 2
  end
  object mmoSQL: TMemo
    Left = 5
    Top = 151
    Width = 415
    Height = 300
    TabOrder = 3
  end
  object butGeraSQL: TButton
    Left = 555
    Top = 151
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 4
    OnClick = butGeraSQLClick
  end
  object spQuery1: TspQuery
    Left = 314
    Top = 245
  end
end
