object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 314
    Top = 245
    object arefas1: TMenuItem
      Caption = 'Tarefas'
      object arefa11: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = arefa11Click
      end
      object arefa21: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = arefa21Click
      end
      object arefa31: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = arefa31Click
      end
    end
  end
end
