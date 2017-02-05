unit UnitServidor_Principal_Metodos;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Datasnap.Provider;

type
  TServidor_Principal_Metodos = class(TDSServerModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDConnection1: TFDConnection;
    Q_Estado: TFDQuery;
    Q_Cidade: TFDQuery;
    DSP_Estado: TDataSetProvider;
    DSP_Cidade: TDataSetProvider;
    procedure DSP_EstadoBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DSP_CidadeBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListarTodos;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TServidor_Principal_Metodos.DSP_CidadeBeforeGetRecords(
  Sender: TObject; var OwnerData: OleVariant);
begin
  //
end;

procedure TServidor_Principal_Metodos.DSP_EstadoBeforeGetRecords(
  Sender: TObject; var OwnerData: OleVariant);
begin
  //
end;

procedure TServidor_Principal_Metodos.ListarTodos;
begin
  Q_Estado.Close;
  Q_Estado.SQL.Clear;
  Q_Estado.SQL.Add('select * from tab_estado');
  Q_Estado.Open;
  Q_Estado.Refresh;
end;
end.

