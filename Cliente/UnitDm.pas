unit UnitDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr;

type
  TDm = class(TDataModule)
  CDS_Estado: TClientDataSet;
  DS_Estado: TDataSource;
  CDS_Cidade: TClientDataSet;
  DS_Cidade: TDataSource;
  CDS_Estadocod_estado: TAutoIncField;
  CDS_Estadocod_pais: TLongWordField;
  CDS_Estadonome_estado: TStringField;
  CDS_Estadosigla_estado: TStringField;
  CDS_Estadocodigo_ibge: TIntegerField;
  CDS_Cidadecod_cidade: TAutoIncField;
  CDS_Cidadecod_estado: TLongWordField;
  CDS_Cidadenome_cidade: TStringField;
  CDS_Cidadecod_cidade_ibge: TIntegerField;
  CDS_Cidadecodigo_localidade_anp: TIntegerField;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
