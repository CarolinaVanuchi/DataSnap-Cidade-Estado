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
    procedure ListarEstado;
    procedure AlterarEstado(cod_estado, cod_pais: Integer; nome_estado,
      sigla_estado: String; codigo_ibge: Integer);
    procedure InserirEstado(cod_pais: Integer; nome_estado : String; sigla_estado : String;
  codigo_ibge: Integer);

   procedure AlterarCidade(cod_cidade, cod_estado: Integer;
      nome_cidade: String; codigo_ibge, codigo_localidade_anp: Integer);
    procedure ExcluirCidade(cod_cidade: Integer);
    procedure InserirCidade(cod_estado: Integer; nome_cidade: String;
      codigo_ibge, codigo_localidade_anp: Integer);
    procedure ListarCidade;
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

procedure TServidor_Principal_Metodos.ListarEstado;
begin
  Q_Estado.Close;
  Q_Estado.SQL.Clear;
  Q_Estado.SQL.Add('select * from tab_estado');
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

procedure TServidor_Principal_Metodos.ListarCidade;
begin
  Q_Cidade.Close;
  Q_Cidade.SQL.Clear;
  Q_Cidade.SQL.Add('select * from tab_cidade');
  Q_Cidade.Open;
  Q_Cidade.Refresh;
end;

procedure TServidor_Principal_Metodos.ExcluirCidade(cod_cidade : Integer);
begin
  Q_Cidade.ExecSQL('delete from tab_cidade where cod_cidade = '+IntToStr(cod_cidade));
end;

procedure TServidor_Principal_Metodos.InserirCidade(cod_estado: Integer; nome_cidade : String;
  codigo_ibge: Integer; codigo_localidade_anp : Integer);
begin
  Q_Cidade.ExecSQL('insert into tab_cidade (cod_estado, nome_cidade, cod_cidade_ibge, codigo_localidade_anp) values (:cod_estado, :nome_cidade, :cod_cidade_ibge, :codigo_localidade_anp)',
      [cod_estado, nome_cidade, codigo_ibge, codigo_localidade_anp]);
end;

procedure TServidor_Principal_Metodos.AlterarCidade(cod_cidade : Integer; cod_estado: Integer; nome_cidade : String;
  codigo_ibge: Integer; codigo_localidade_anp : Integer);
begin
  Q_Cidade.ExecSQL('update tab_cidade set cod_estado = '+IntToStr(cod_estado)
      + ', nome_cidade = "'+nome_cidade+'", cod_cidade_ibge = "'+IntToStr(codigo_ibge)+'", codigo_localidade_anp = '+IntToStr(codigo_localidade_anp)+' where cod_cidade = '+IntToStr(cod_cidade));
end;
end.

