unit UnitCad_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, UnitCliente_Principal, UnitMetodos;

type
  TCad_Estado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ActiEstado: TActionList;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    ActSair: TAction;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Button5: TButton;
    ActPesquisa: TAction;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtCod: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtIBGE: TEdit;
    Label5: TLabel;
    edtNome: TEdit;
    Label6: TLabel;
    edtSigla: TEdit;
    edtPais: TEdit;
    ActSalvar: TAction;
    Button6: TButton;
    CDS_Estado: TClientDataSet;
    DS_Estado: TDataSource;
    CDS_Estadocod_estado: TAutoIncField;
    CDS_Estadocod_pais: TLongWordField;
    CDS_Estadonome_estado: TStringField;
    CDS_Estadosigla_estado: TStringField;
    CDS_Estadocodigo_ibge: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActPesquisaExecute(Sender: TObject);
  private
    procedure Filtrar;
    procedure BuscarTodos;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Cad_Estado: TCad_Estado;

implementation

{$R *.dfm}


procedure TCad_Estado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CDS_Estado.Close;
end;

procedure TCad_Estado.FormCreate(Sender: TObject);
begin
  CDS_Estado.Open;
end;

procedure TCad_Estado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
    Close;
end;

procedure TCad_Estado.Filtrar;
begin
  with CDS_Estado do
    begin
      if edtPesquisa.Text <> '' then
        begin
          Close;
          Filtered := False;
          Filter := ' UPPER(nome_estado) LIKE '+QuotedStr('%'+edtPesquisa.Text+'%');
          Filtered := True;
          Open;
        end
      else
       CDS_Estado.Filtered := False;
    end;
end;

procedure TCad_Estado.ActPesquisaExecute(Sender: TObject);
begin
  Filtrar;
end;

procedure TCad_Estado.BuscarTodos;
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Cliente_Principal.SQLConnection1.DBXConnection);
  try
    CDS_Estado.Close;
    conexao.ListarTodos;
    CDS_Estado.Open;
    CDS_Estado.Refresh;
  finally
    FreeAndNil(conexao);
  end;
end;
end.
