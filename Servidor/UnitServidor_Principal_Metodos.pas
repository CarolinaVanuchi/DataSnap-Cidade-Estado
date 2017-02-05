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
    procedure ExcluirEstado(cod_estado: Integer);
    procedure ListarTodos(tabela : String);
    procedure AlterarEstado(cod_estado, cod_pais: Integer; nome_estado,
      sigla_estado: String; codigo_ibge: Integer);
    procedure InserirEstado(cod_pais: Integer; nome_estado : String; sigla_estado : String;
  codigo_ibge: Integer);
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

procedure TServidor_Principal_Metodos.ListarTodos(tabela : String);
begin
  Q_Estado.Close;
  Q_Estado.SQL.Clear;
  Q_Estado.SQL.Add('select * from '+tabela);
  Q_Estado.Open;
  Q_Estado.Refresh;
end;

procedure TServidor_Principal_Metodos.ExcluirEstado(cod_estado : Integer);
begin
  Q_Estado.ExecSQL('delete from tab_estado where cod_estado = '+IntToStr(cod_estado));
end;

procedure TServidor_Principal_Metodos.InserirEstado(cod_pais: Integer; nome_estado : String; sigla_estado : String;
  codigo_ibge: Integer);
begin
  Q_Estado.ExecSQL('insert into tab_estado (cod_pais, nome_estado, sigla_estado, codigo_ibge) values (:cod_pais, :nome_estado, :sigla_estado, :codigo_ibge)',
      [cod_pais, nome_estado, sigla_estado, codigo_ibge]);
end;

procedure TServidor_Principal_Metodos.AlterarEstado(cod_estado : Integer; cod_pais: Integer; nome_estado, sigla_estado : String; codigo_ibge : Integer);
begin
  Q_Estado.ExecSQL('update tab_estado set cod_pais = '+IntToStr(cod_pais)
      + ', nome_estado = "'+nome_estado+'", sigla_estado = "'+sigla_estado+'", codigo_ibge = '+IntToStr(codigo_ibge)+' where cod_estado = '+IntToStr(cod_estado));
end;

end.

