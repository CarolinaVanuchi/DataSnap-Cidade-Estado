//
// Created by the DataSnap proxy generator.
// 05/02/2017 10:43:52
//

unit UnitMetodos;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServidor_Principal_MetodosClient = class(TDSAdminClient)
  private
    FDSP_EstadoBeforeGetRecordsCommand: TDBXCommand;
    FDSP_CidadeBeforeGetRecordsCommand: TDBXCommand;
    FListarTodosCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSP_EstadoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DSP_CidadeBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure ListarTodos;
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

procedure TServidor_Principal_MetodosClient.ListarTodos;
begin
  if FListarTodosCommand = nil then
  begin
    FListarTodosCommand := FDBXConnection.CreateCommand;
    FListarTodosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListarTodosCommand.Text := 'TServidor_Principal_Metodos.ListarTodos';
    FListarTodosCommand.Prepare;
  end;
  FListarTodosCommand.ExecuteUpdate;
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
  FListarTodosCommand.DisposeOf;
  inherited;
end;

end.

