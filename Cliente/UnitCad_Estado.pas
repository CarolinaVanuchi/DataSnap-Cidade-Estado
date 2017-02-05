unit UnitCad_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, UnitCliente_Principal, UnitMetodos, Vcl.Mask,
  Vcl.DBCtrls;

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
    edtCod: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtIBGE: TDBEdit;
    Label5: TLabel;
    edtNome: TDBEdit;
    Label6: TLabel;
    edtSigla: TDBEdit;
    ActSalvar: TAction;
    Button6: TButton;
    CDS_Estado: TClientDataSet;
    DS_Estado: TDataSource;
    CDS_Estadocod_estado: TAutoIncField;
    CDS_Estadocod_pais: TLongWordField;
    CDS_Estadonome_estado: TStringField;
    CDS_Estadosigla_estado: TStringField;
    CDS_Estadocodigo_ibge: TIntegerField;
    ActCancela: TAction;
    Button7: TButton;
    edtPais: TDBLookupComboBox;
    DS_Pais: TDataSource;
    CDS_Pais: TClientDataSet;
    CDS_Paiscod_pais: TAutoIncField;
    CDS_Paisnome_pais: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActPesquisaExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure DS_EstadoDataChange(Sender: TObject; Field: TField);
    procedure ActAlterarExecute(Sender: TObject);
    procedure ActIncluirExecute(Sender: TObject);
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActCancelaExecute(Sender: TObject);
  private
    procedure Filtrar;
    procedure BuscarTodos;
    procedure HabilitarEdicao;
    procedure DesabilitarEdicao;
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
  DesabilitarEdicao;
  CDS_Estado.Close;
end;

procedure TCad_Estado.FormCreate(Sender: TObject);
begin
  CDS_Estado.Open;
  CDS_Pais.Open;
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

procedure TCad_Estado.ActAlterarExecute(Sender: TObject);
begin
  CDS_Estado.Edit;
  PageControl1.TabIndex := 0;
  ActSalvar.Enabled := True;
  HabilitarEdicao;
end;

procedure TCad_Estado.ActCancelaExecute(Sender: TObject);
begin
  ActSalvar.Enabled := False;
  PageControl1.TabIndex := 1;
  DesabilitarEdicao;
end;

procedure TCad_Estado.ActExcluirExecute(Sender: TObject);
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Cliente_Principal.SQLConnection1.DBXConnection);
  try
    if CDS_Estadocod_estado.AsInteger > 0 then
      begin
        if MessageDlg('Deseja mesmo excluir o Estado '+CDS_Estadonome_estado.AsString+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            conexao.ExcluirEstado(CDS_Estadocod_estado.AsInteger);
            BuscarTodos;
          end;
      end;
  finally
    FreeAndNil(conexao);
  end;
end;

procedure TCad_Estado.ActIncluirExecute(Sender: TObject);
begin
  CDS_Estado.Append;
  PageControl1.TabIndex := 0;
  ActSalvar.Enabled := True;
  HabilitarEdicao;
end;

procedure TCad_Estado.ActPesquisaExecute(Sender: TObject);
begin
  Filtrar;
end;

procedure TCad_Estado.ActSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TCad_Estado.ActSalvarExecute(Sender: TObject);
var
  conexao : TServidor_Principal_MetodosClient;
begin
 conexao := TServidor_Principal_MetodosClient.Create(Cliente_Principal.SQLConnection1.DBXConnection);
 try
  if not(CDS_Estadocod_estado.AsInteger > 0) then
    begin
      conexao.InserirEstado(CDS_Estadocod_pais.AsInteger, CDS_Estadonome_estado.AsString, CDS_Estadosigla_estado.AsString, CDS_Estadocodigo_ibge.AsInteger);
    end
  else
    begin
      conexao.alterarEstado(CDS_Estadocod_estado.AsInteger,
      CDS_Estadocod_pais.AsInteger, CDS_Estadonome_estado.AsString, CDS_Estadosigla_estado.AsString, CDS_Estadocodigo_ibge.AsInteger);
    end;
 finally
   FreeAndNil(conexao);
   BuscarTodos;
   PageControl1.TabIndex := 1;
   ActSalvar.Enabled := False;
   DesabilitarEdicao;
 end;
end;

procedure TCad_Estado.BuscarTodos;
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Cliente_Principal.SQLConnection1.DBXConnection);
  try
    CDS_Estado.Close;
    conexao.ListarEstado;
    CDS_Estado.Open;
    CDS_Estado.Refresh;
  finally
    FreeAndNil(conexao);
  end;
end;
procedure TCad_Estado.DS_EstadoDataChange(Sender: TObject; Field: TField);
begin
    ActAlterar.Enabled := not(CDS_Estado.IsEmpty);
    ActExcluir.Enabled := not(CDS_Estado.IsEmpty);
end;

procedure TCad_Estado.HabilitarEdicao;
begin
  edtPais.Enabled  := True;
  edtIBGE.Enabled  := True;
  edtSigla.Enabled := True;
  edtNome.Enabled  := True;
end;

procedure TCad_Estado.DesabilitarEdicao;
begin
  edtPais.Enabled  := False;
  edtIBGE.Enabled  := False;
  edtSigla.Enabled := False;
  edtNome.Enabled  := False;
end;
end.
