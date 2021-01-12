unit uspQuery;

interface

uses
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client;

type
  EQuantidadeTabelasInvalida = class(Exception);

  TspQuery = class(TFDQuery)
  strict private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
    procedure ChecarQuantidadeTabelasInformadas();
    function ObterColunas(): string;
    function ObterTabelas(): string;
    function ObterCondicoes(): string;
    procedure SetspCondicoes(const AValue: TStringList);
    procedure SetspColunas(const AValue: TStringList);
    procedure SetspTabelas(const AValue: TStringList);
  public
    destructor Destroy(); override;
    procedure AfterConstruction(); override;
    procedure GeraSQL();
    procedure LimpaSQL();
  published
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
    property spColunas: TStringList read FspColunas write SetspColunas;
    property spTabelas: TStringList read FspTabelas write SetspTabelas;
  end;

resourcestring
  SQUANTIDADETABEALASINVALIDA = 'A quantidade de tabelas informadas é inválida.' +
    ' Somente uma uma tabela é permitida, porém existe(m) %d tabela(s).';

implementation

{ TspQuery }

procedure TspQuery.AfterConstruction();
begin
  inherited AfterConstruction();
  FspCondicoes := TStringList.Create();
  FspColunas := TStringList.Create();
  FspTabelas := TStringList.Create();
end;

procedure TspQuery.ChecarQuantidadeTabelasInformadas();
begin
  {TODO -oJerônimo -cImplement : Remove "empty" lines.}
  if (FspTabelas.Count <> 1) then
    raise EQuantidadeTabelasInvalida.CreateFmt(SQUANTIDADETABEALASINVALIDA, [FspTabelas.Count]);
end;

destructor TspQuery.Destroy();
begin
  FreeAndNil(FspCondicoes);
  FreeAndNil(FspColunas);
  FreeAndNil(FspTabelas);
  inherited Destroy();
end;

procedure TspQuery.GeraSQL();
var
  LSQL: TStringList;
begin
  ChecarQuantidadeTabelasInformadas();
  LSQL := TStringList.Create();
  try
    LSQL.Add(ObterColunas());
    LSQL.Add(ObterTabelas());
    LSQL.Add(ObterCondicoes());
    SQL.Text := LSQL.Text;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TspQuery.LimpaSQL();
begin
  FspCondicoes.Clear();
  FspColunas.Clear();
  FspTabelas.Clear();
  SQL.Clear();
end;

function TspQuery.ObterColunas(): string;
begin
  Result := 'SELECT ';
  if (FspColunas.Count = 0) then
    Result := Result + '*'
  else
    Result := Result + FspColunas.CommaText;
end;

function TspQuery.ObterCondicoes(): string;
begin
  Result := FspCondicoes.Text;
end;

function TspQuery.ObterTabelas(): string;
begin
  Result := 'FROM ' + FspTabelas.Text.Replace(sLineBreak, EmptyStr);
end;

procedure TspQuery.SetspColunas(const AValue: TStringList);
begin
  FspColunas.Assign(AValue);
end;

procedure TspQuery.SetspCondicoes(const AValue: TStringList);
begin
  FspCondicoes.Assign(AValue);
end;

procedure TspQuery.SetspTabelas(const AValue: TStringList);
begin
  FspTabelas.Assign(AValue);
end;

end.
