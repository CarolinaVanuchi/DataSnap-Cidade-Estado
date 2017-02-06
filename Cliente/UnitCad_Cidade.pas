unit UnitCad_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitForm_Padrao, System.Actions,
  Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, UnitDm, UnitMetodos;

type
  TCad_Cidade = class(TFrm_Padro)
    edtEstado: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtIBGE: TDBEdit;
    edtLocalidade: TDBEdit;
    edtNome: TDBEdit;
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure ActInserirExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DesabilitarEdicao;
    procedure HabilitarEdicao;
    procedure BuscarTodos;
    procedure Filtrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cad_Cidade: TCad_Cidade;

implementation

{$R *.dfm}

procedure TCad_Cidade.Filtrar;
begin
  with Dm.CDS_Cidade do
    begin
      if edtPesquisa.Text <> '' then
        begin
          Close;
          Filtered := False;
          Filter := ' UPPER(nome_cidade) LIKE '+QuotedStr('%'+edtPesquisa.Text+'%');
          Filtered := True;
          Open;
        end
      else
       Filtered := False;
    end;
end;

procedure TCad_Cidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DesabilitarEdicao;
  Dm.CDS_Cidade.Close;
  Dm.CDS_Estado.Close;
end;

procedure TCad_Cidade.FormShow(Sender: TObject);
begin
  inherited;
   Dm.CDS_Cidade.Open;
   Dm.CDS_Estado.Open;
end;

procedure TCad_Cidade.ActAlterarExecute(Sender: TObject);
begin
  inherited;
  Dm.CDS_Cidade.Edit;
  HabilitarEdicao;
end;

procedure TCad_Cidade.ActCancelarExecute(Sender: TObject);
begin
  inherited;
  DesabilitarEdicao;
  BuscarTodos;
end;

procedure TCad_Cidade.ActExcluirExecute(Sender: TObject);
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Dm.SQLConnection1.DBXConnection);
  try
    if Dm.CDS_Cidadecod_cidade.AsInteger > 0 then
      begin
        if MessageDlg('Deseja mesmo excluir o Estado '+Dm.CDS_Cidadenome_cidade.AsString+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            conexao.ExcluirCidade(Dm.CDS_Cidadecod_cidade.AsInteger);
            BuscarTodos;
          end;
      end;
  finally
    FreeAndNil(conexao);
  end;
  inherited;
end;

procedure TCad_Cidade.ActInserirExecute(Sender: TObject);
begin
  inherited;
  Dm.CDS_Cidade.Append;
  HabilitarEdicao;
end;

procedure TCad_Cidade.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TCad_Cidade.ActSalvarExecute(Sender: TObject);
var
  conexao : TServidor_Principal_MetodosClient;
begin
 conexao := TServidor_Principal_MetodosClient.Create(Dm.SQLConnection1.DBXConnection);
 try
  if not(Dm.CDS_Cidadecod_cidade.AsInteger > 0) then
    begin
      conexao.InserirCidade(Dm.CDS_Cidadecod_estado.AsInteger, Dm.CDS_Cidadenome_cidade.AsString, Dm.CDS_Cidadecod_cidade_ibge.AsInteger, Dm.CDS_Cidadecodigo_localidade_anp.AsInteger);
    end
  else
    begin
      conexao.alterarCidade(Dm.CDS_Cidadecod_cidade.AsInteger,
        Dm.CDS_Cidadecod_estado.AsInteger, Dm.CDS_Cidadenome_cidade.AsString, Dm.CDS_Cidadecod_cidade_ibge.AsInteger, Dm.CDS_Cidadecodigo_localidade_anp.AsInteger);
    end;
 finally
   FreeAndNil(conexao);
   BuscarTodos;
   ActSalvar.Enabled := False;
   DesabilitarEdicao;
 end;
  inherited;
end;

procedure TCad_Cidade.BuscarTodos;
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Dm.SQLConnection1.DBXConnection);
  try
    Dm.CDS_Cidade.Close;
    conexao.ListarCidade;
    Dm.CDS_Cidade.Open;
  finally
    FreeAndNil(conexao);
  end;
end;

procedure TCad_Cidade.HabilitarEdicao;
begin
  edtCod.Enabled         := True;
  edtEstado.Enabled      := True;
  edtIBGE.Enabled        := True;
  edtLocalidade.Enabled  := True;
  edtNome.Enabled        := True;
end;

procedure TCad_Cidade.DesabilitarEdicao;
begin
  edtCod.Enabled         := False;
  edtEstado.Enabled      := False;
  edtIBGE.Enabled        := False;
  edtLocalidade.Enabled  := False;
  edtNome.Enabled        := False;
end;
end.
