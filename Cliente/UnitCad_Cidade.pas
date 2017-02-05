unit UnitCad_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TCad_Cidade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    AcCidade: TActionList;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    ActSair: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    ActPesquisa: TAction;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigo: TEdit;
    edtEstado: TEdit;
    edtIBGE: TEdit;
    edtLocalidade: TEdit;
    edtNome: TEdit;
    ActSalvar: TAction;
    Button6: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cad_Cidade: TCad_Cidade;

implementation

{$R *.dfm}

procedure TCad_Cidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
    Close;
end;

end.
