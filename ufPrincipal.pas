unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    arefas1: TMenuItem;
    arefa11: TMenuItem;
    arefa21: TMenuItem;
    arefa31: TMenuItem;
    procedure arefa11Click(Sender: TObject);
    procedure arefa31Click(Sender: TObject);
    procedure arefa21Click(Sender: TObject);
  private
  public
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  ufTarefa1,
  ufTarefa2,
  ufTarefa3;

{$R *.dfm}

procedure TfPrincipal.arefa11Click(Sender: TObject);
var
  LfTarefa1: TfTarefa1;
begin
  LfTarefa1 := TfTarefa1.Create(Self);
  LfTarefa1.Show();
end;

procedure TfPrincipal.arefa21Click(Sender: TObject);
var
  LfTarefa2: TfTarefa2;
begin
  LfTarefa2 := TfTarefa2.Create(Self);
  LfTarefa2.Show();
end;

procedure TfPrincipal.arefa31Click(Sender: TObject);
var
  LfTarefa3: TfTarefa3;
begin
  LfTarefa3 := TfTarefa3.Create(Self);
  LfTarefa3.Show();
end;

end.
