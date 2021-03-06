//
// Created by the DataSnap proxy generator.
// 05/02/2017 14:45:23
//

unit UnitMetodos;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServidor_Principal_MetodosClient = class(TDSAdminClient)
  private
    FDSP_EstadoBeforeGetRecordsCommand: TDBXCommand;
    FDSP_CidadeBeforeGetRecordsCommand: TDBXCommand;
    FExcluirEstadoCommand: TDBXCommand;
    FListarEstadoCommand: TDBXCommand;
    FAlterarEstadoCommand: TDBXCommand;
    FInserirEstadoCommand: TDBXCommand;
    FAlterarCidadeCommand: TDBXCommand;
    FExcluirCidadeCommand: TDBXCommand;
    FInserirCidadeCommand: TDBXCommand;
    FListarCidadeCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSP_EstadoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DSP_CidadeBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure ExcluirEstado(cod_estado: Integer);
    procedure ListarEstado;
    procedure AlterarEstado(cod_estado: Integer; cod_pais: Integer; nome_estado: string; sigla_estado: string; codigo_ibge: Integer);
    procedure InserirEstado(cod_pais: Integer; nome_estado: string; sigla_estado: string; codigo_ibge: Integer);
    procedure AlterarCidade(cod_cidade: Integer; cod_estado: Integer; nome_cidade: string; codigo_ibge: Integer; codigo_localidade_anp: Integer);
    procedure ExcluirCidade(cod_cidade: Integer);
    procedure InserirCidade(cod_estado: Integer; nome_cidade: string; codigo_ibge: Integer; codigo_localidade_anp: Integer);
    procedure ListarCidade;
  end;

implementation

procedure TServidor_Principal_MetodosClient.DSP_EstadoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  if FDSP_EstadoBeforeGetRecordsCommand = nil then
  begin
    FDSP_EstadoBeforeGetRecordsCommand := FDBXConnection.CreateCommand;
    FDSP_EstadoBeforeGetRecordsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSP_EstadoBeforeGetRecordsCommand.Text := 'TServidor_Principal_Metodos.DSP_EstadoBeforeGetRecords';
    FDSP_EstadoBeforeGetRecordsCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSP_EstadoBeforeGetRecordsCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSP_EstadoBeforeGetRecordsCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSP_EstadoBeforeGetRecordsCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSP_EstadoBeforeGetRecordsCommand.Parameters[1].Value.AsVariant := OwnerData;
  FDSP_EstadoBeforeGetRecordsCommand.ExecuteUpdate;
  OwnerData := FDSP_EstadoBeforeGetRecordsCommand.Parameters[1].Value.AsVariant;
end;

procedure TServidor_Principal_MetodosClient.DSP_CidadeBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  if FDSP_CidadeBeforeGetRecordsCommand = nil then
  begin
    FDSP_CidadeBeforeGetRecordsCommand := FDBXConnection.CreateCommand;
    FDSP_CidadeBeforeGetRecordsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSP_CidadeBeforeGetRecordsCommand.Text := 'TServidor_Principal_Metodos.DSP_CidadeBeforeGetRecords';
    FDSP_CidadeBeforeGetRecordsCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSP_CidadeBeforeGetRecordsCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSP_CidadeBeforeGetRecordsCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSP_CidadeBeforeGetRecordsCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSP_CidadeBeforeGetRecordsCommand.Parameters[1].Value.AsVariant := OwnerData;
  FDSP_CidadeBeforeGetRecordsCommand.ExecuteUpdate;
  OwnerData := FDSP_CidadeBeforeGetRecordsCommand.Parameters[1].Value.AsVariant;
end;

procedure TServidor_Principal_MetodosClient.ExcluirEstado(cod_estado: Integer);
begin
  if FExcluirEstadoCommand = nil then
  begin
    FExcluirEstadoCommand := FDBXConnection.CreateCommand;
    FExcluirEstadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExcluirEstadoCommand.Text := 'TServidor_Principal_Metodos.ExcluirEstado';
    FExcluirEstadoCommand.Prepare;
  end;
  FExcluirEstadoCommand.Parameters[0].Value.SetInt32(cod_estado);
  FExcluirEstadoCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.ListarEstado;
begin
  if FListarEstadoCommand = nil then
  begin
    FListarEstadoCommand := FDBXConnection.CreateCommand;
    FListarEstadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListarEstadoCommand.Text := 'TServidor_Principal_Metodos.ListarEstado';
    FListarEstadoCommand.Prepare;
  end;
  FListarEstadoCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.AlterarEstado(cod_estado: Integer; cod_pais: Integer; nome_estado: string; sigla_estado: string; codigo_ibge: Integer);
begin
  if FAlterarEstadoCommand = nil then
  begin
    FAlterarEstadoCommand := FDBXConnection.CreateCommand;
    FAlterarEstadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAlterarEstadoCommand.Text := 'TServidor_Principal_Metodos.AlterarEstado';
    FAlterarEstadoCommand.Prepare;
  end;
  FAlterarEstadoCommand.Parameters[0].Value.SetInt32(cod_estado);
  FAlterarEstadoCommand.Parameters[1].Value.SetInt32(cod_pais);
  FAlterarEstadoCommand.Parameters[2].Value.SetWideString(nome_estado);
  FAlterarEstadoCommand.Parameters[3].Value.SetWideString(sigla_estado);
  FAlterarEstadoCommand.Parameters[4].Value.SetInt32(codigo_ibge);
  FAlterarEstadoCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.InserirEstado(cod_pais: Integer; nome_estado: string; sigla_estado: string; codigo_ibge: Integer);
begin
  if FInserirEstadoCommand = nil then
  begin
    FInserirEstadoCommand := FDBXConnection.CreateCommand;
    FInserirEstadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInserirEstadoCommand.Text := 'TServidor_Principal_Metodos.InserirEstado';
    FInserirEstadoCommand.Prepare;
  end;
  FInserirEstadoCommand.Parameters[0].Value.SetInt32(cod_pais);
  FInserirEstadoCommand.Parameters[1].Value.SetWideString(nome_estado);
  FInserirEstadoCommand.Parameters[2].Value.SetWideString(sigla_estado);
  FInserirEstadoCommand.Parameters[3].Value.SetInt32(codigo_ibge);
  FInserirEstadoCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.AlterarCidade(cod_cidade: Integer; cod_estado: Integer; nome_cidade: string; codigo_ibge: Integer; codigo_localidade_anp: Integer);
begin
  if FAlterarCidadeCommand = nil then
  begin
    FAlterarCidadeCommand := FDBXConnection.CreateCommand;
    FAlterarCidadeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAlterarCidadeCommand.Text := 'TServidor_Principal_Metodos.AlterarCidade';
    FAlterarCidadeCommand.Prepare;
  end;
  FAlterarCidadeCommand.Parameters[0].Value.SetInt32(cod_cidade);
  FAlterarCidadeCommand.Parameters[1].Value.SetInt32(cod_estado);
  FAlterarCidadeCommand.Parameters[2].Value.SetWideString(nome_cidade);
  FAlterarCidadeCommand.Parameters[3].Value.SetInt32(codigo_ibge);
  FAlterarCidadeCommand.Parameters[4].Value.SetInt32(codigo_localidade_anp);
  FAlterarCidadeCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.ExcluirCidade(cod_cidade: Integer);
begin
  if FExcluirCidadeCommand = nil then
  begin
    FExcluirCidadeCommand := FDBXConnection.CreateCommand;
    FExcluirCidadeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExcluirCidadeCommand.Text := 'TServidor_Principal_Metodos.ExcluirCidade';
    FExcluirCidadeCommand.Prepare;
  end;
  FExcluirCidadeCommand.Parameters[0].Value.SetInt32(cod_cidade);
  FExcluirCidadeCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.InserirCidade(cod_estado: Integer; nome_cidade: string; codigo_ibge: Integer; codigo_localidade_anp: Integer);
begin
  if FInserirCidadeCommand = nil then
  begin
    FInserirCidadeCommand := FDBXConnection.CreateCommand;
    FInserirCidadeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInserirCidadeCommand.Text := 'TServidor_Principal_Metodos.InserirCidade';
    FInserirCidadeCommand.Prepare;
  end;
  FInserirCidadeCommand.Parameters[0].Value.SetInt32(cod_estado);
  FInserirCidadeCommand.Parameters[1].Value.SetWideString(nome_cidade);
  FInserirCidadeCommand.Parameters[2].Value.SetInt32(codigo_ibge);
  FInserirCidadeCommand.Parameters[3].Value.SetInt32(codigo_localidade_anp);
  FInserirCidadeCommand.ExecuteUpdate;
end;

procedure TServidor_Principal_MetodosClient.ListarCidade;
begin
  if FListarCidadeCommand = nil then
  begin
    FListarCidadeCommand := FDBXConnection.CreateCommand;
    FListarCidadeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListarCidadeCommand.Text := 'TServidor_Principal_Metodos.ListarCidade';
    FListarCidadeCommand.Prepare;
  end;
  FListarCidadeCommand.ExecuteUpdate;
end;


constructor TServidor_Principal_MetodosClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServidor_Principal_MetodosClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServidor_Principal_MetodosClient.Destroy;
begin
  FDSP_EstadoBeforeGetRecordsCommand.DisposeOf;
  FDSP_CidadeBeforeGetRecordsCommand.DisposeOf;
  FExcluirEstadoCommand.DisposeOf;
  FListarEstadoCommand.DisposeOf;
  FAlterarEstadoCommand.DisposeOf;
  FInserirEstadoCommand.DisposeOf;
  FAlterarCidadeCommand.DisposeOf;
  FExcluirCidadeCommand.DisposeOf;
  FInserirCidadeCommand.DisposeOf;
  FListarCidadeCommand.DisposeOf;
  inherited;
end;

end.

