unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.Math, System.SyncObjs, Vcl.ExtCtrls;

type
  ILogOperacoes = interface
    ['{F1DF1AB2-B0C6-40BB-9BB8-21F032ECE01A}']
    procedure Mensagem(const AValue: string);
  end;

  TfTarefa2 = class(TForm, ILogOperacoes)
    labThreads: TLabel;
    edtNumero: TEdit;
    butIniciar: TButton;
    ProgressBar1: TProgressBar;
    mmoLog: TMemo;
    Label2: TLabel;
    edtIntervalo: TEdit;
    Label3: TLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure butIniciarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FThreadsRodando: Integer;
    procedure Mensagem(const AValue: string);
    procedure OnThreadTerminate(Sender: TObject);
  private const
    MAX_PROGRESSO = 101;
  public
  end;

  TParametrosThread = record
  public
    IntervaloMaximo: Integer;
    BarraProgresso: TProgressBar;
  end;

  TProcessoThread = class(TThread)
  strict private
    FLog: ILogOperacoes;
    FParametros: TParametrosThread;
    function ObterIntervalo(): Integer;
    procedure IncrementarBarraProgresso();
  strict protected
    procedure Execute(); override;
  public
    constructor Create(const ALog: ILogOperacoes; const AParametros: TParametrosThread); reintroduce; overload;
    class function New(const ALog: ILogOperacoes;
      const AParametros: TParametrosThread): TProcessoThread;
  end;

{var
  fTarefa2: TfTarefa2;}

implementation

{$R *.dfm}

procedure TfTarefa2.butIniciarClick(Sender: TObject);
var
  LParametros: TParametrosThread;
  LIndice: Integer;
  LNumeroThreads: Integer;
begin
  if (StrToIntDef(edtNumero.Text, 0) > 1000) then
    raise Exception.Create('O número máximo de threads é 1000');
  FThreadsRodando := 0;
  mmoLog.Clear();
  ProgressBar1.Position := 0;
  LNumeroThreads := StrToIntDef(edtNumero.Text, 0);
  butIniciar.Enabled := (LNumeroThreads = 0);
  try
    ProgressBar1.Max := LNumeroThreads * MAX_PROGRESSO;
    LParametros.IntervaloMaximo := StrToIntDef(edtIntervalo.Text, 0);
    LParametros.BarraProgresso := ProgressBar1;
    for LIndice := 1 to LNumeroThreads do
    begin
      TProcessoThread.New(Self, LParametros).OnTerminate := OnThreadTerminate;
      TInterlocked.Increment(FThreadsRodando);
    end;
  except
    butIniciar.Enabled := True;
    raise;
  end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (FThreadsRodando = 0);
end;

procedure TfTarefa2.Mensagem(const AValue: string);
begin
  TThread.Synchronize(nil,
    procedure()
    begin
      mmoLog.Lines.Add(AValue);
    end);
end;

procedure TfTarefa2.OnThreadTerminate(Sender: TObject);
begin
  TInterlocked.Decrement(FThreadsRodando);
  if (FThreadsRodando = 0) then
    butIniciar.Enabled := True;
end;

procedure TfTarefa2.Timer1Timer(Sender: TObject);
begin
  labThreads.Caption := Format('Threads rodando %d', [FThreadsRodando]);
end;

{ TProcessoThread }

constructor TProcessoThread.Create(const ALog: ILogOperacoes; const AParametros: TParametrosThread);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  FLog := ALog;
  FParametros := AParametros;
end;

procedure TProcessoThread.Execute();
var
  LProgresso: Integer;
begin
  Randomize();
  FLog.Mensagem(Format('%d - Iniciando processamento', [ThreadID]));
  for LProgresso := 0 to 100 do
  begin
    IncrementarBarraProgresso();
    TThread.Sleep(ObterIntervalo());
  end;
  FLog.Mensagem(Format('%d - Processamento finalizado', [ThreadID]));
end;

procedure TProcessoThread.IncrementarBarraProgresso();
begin
  Synchronize(
    procedure()
    begin
      FParametros.BarraProgresso.Position := FParametros.BarraProgresso.Position + 1;
    end);
end;

class function TProcessoThread.New(const ALog: ILogOperacoes;
  const AParametros: TParametrosThread): TProcessoThread;
begin
  Result := TProcessoThread.Create(ALog, AParametros);
  Result.Start();
end;

function TProcessoThread.ObterIntervalo(): Integer;
begin
  Result := Random(FParametros.IntervaloMaximo);
end;

end.
