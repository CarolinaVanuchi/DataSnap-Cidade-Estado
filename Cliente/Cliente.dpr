program Cliente;

uses
  Vcl.Forms,
  UnitCliente_Principal in 'UnitCliente_Principal.pas' {Cliente_Principal},
  UnitMetodos in 'UnitMetodos.pas',
  UnitDm in 'UnitDm.pas' {Dm: TDataModule},
  UnitForm_Padrao in 'UnitForm_Padrao.pas' {Frm_Padro},
  UnitCad_Estado in 'UnitCad_Estado.pas' {Cad_Estado},
  UnitCad_Cidade in 'UnitCad_Cidade.pas' {Cad_Cidade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCliente_Principal, Cliente_Principal);
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrm_Padro, Frm_Padro);
  Application.CreateForm(TCad_Estado, Cad_Estado);
  Application.CreateForm(TCad_Cidade, Cad_Cidade);
  Application.Run;
end.
