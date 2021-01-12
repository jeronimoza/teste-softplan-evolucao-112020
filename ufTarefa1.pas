unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys, uspQuery;

type
  TfTarefa1 = class(TForm)
    Label1: TLabel;
    mmoColunas: TMemo;
    Label2: TLabel;
    mmoTabelas: TMemo;
    Label3: TLabel;
    mmoCondicoes: TMemo;
    Label4: TLabel;
    mmoSQL: TMemo;
    butGeraSQL: TButton;
    spQuery1: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butGeraSQLClick(Sender: TObject);
  private
  public
  end;

{var
  fTarefa1: TfTarefa1;}

implementation

{$R *.dfm}

procedure TfTarefa1.butGeraSQLClick(Sender: TObject);
begin
  spQuery1.LimpaSQL();
  spQuery1.spColunas.Text := mmoColunas.Lines.Text;
  spQuery1.spTabelas.Text := mmoTabelas.Lines.Text;
  spQuery1.spCondicoes.Text := mmoCondicoes.Lines.Text;
  spQuery1.GeraSQL();
  mmoSQL.Text := spQuery1.SQL.Text;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
