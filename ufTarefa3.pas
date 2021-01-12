unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  FireDAC.Comp.Client;

type
  TfTarefa3 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    butObterTotal: TButton;
    butObterTotalDivisoes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure butObterTotalClick(Sender: TObject);
    procedure butObterTotalDivisoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDados: TFDMemTable;
    FDataSource: TDataSource;
    procedure CriarDataControls();
    procedure CriarCamposDados();
    procedure CriarColunasGrid();
    procedure PopularDados();
    function ObterSomaCampoValor(): Double;
    function ObterTotalDivisoes(): Double;
  public
  end;

{var
  fTarefa3: TfTarefa3;}

implementation

{$R *.dfm}

{ TfTarefa3 }

procedure TfTarefa3.butObterTotalClick(Sender: TObject);
begin
  edtTotal.Text := FormatFloat('0.00', ObterSomaCampoValor());
end;

procedure TfTarefa3.butObterTotalDivisoesClick(Sender: TObject);
begin
  edtTotalDivisoes.Text := FormatFloat('0.00', ObterTotalDivisoes());
end;

procedure TfTarefa3.CriarCamposDados();
begin
  FDados.FieldDefs.Add('idProjeto', ftInteger);
  FDados.FieldDefs.Add('NomeProjeto', ftString, 50);
  FDados.FieldDefs.Add('Valor', ftCurrency);
end;

procedure TfTarefa3.CriarColunasGrid();
begin
  DBGrid1.Columns.Add().FieldName := 'idProjeto';
  DBGrid1.Columns.Add().FieldName := 'NomeProjeto';
  DBGrid1.Columns.Add().FieldName := 'Valor';
end;

procedure TfTarefa3.CriarDataControls();
begin
  FDados := TFDMemTable.Create(Self);
  CriarCamposDados();
  FDados.CreateDataSet();

  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FDados;

  DBGrid1.DataSource := FDataSource;
  CriarColunasGrid();
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriarDataControls();
  PopularDados();
end;

function TfTarefa3.ObterSomaCampoValor(): Double;
var
  LFieldValor: TField;
begin
  Result := 0;
  LFieldValor := FDados.FieldByName('Valor');
  FDados.DisableControls();
  try
    FDados.First();
    while (not FDados.Eof) do
    begin
      Result := Result + LFieldValor.AsFloat;
      FDados.Next();
    end;
  finally
    FDados.EnableControls();
  end;
end;

function TfTarefa3.ObterTotalDivisoes(): Double;
var
  LValor: Double;
  LFieldValor: TField;
begin
  Result := 0;
  LFieldValor := FDados.FieldByName('Valor');
  FDados.DisableControls();
  try
    FDados.First();
    repeat
      LValor := LFieldValor.AsFloat;
      FDados.RecNo := FDados.RecNo + 1;
      if (LValor > 0) then
        Result := Result + (LFieldValor.AsFloat / LValor);
    until (FDados.RecNo = FDados.RecordCount);
  finally
    FDados.EnableControls();
  end;
end;

procedure TfTarefa3.PopularDados();
var
  LIndex: Integer;
begin
  for LIndex := 1 to 10 do
    FDados.AppendRecord([LIndex, Format('Projeto %d', [LIndex]), LIndex * 10]);
end;

end.
