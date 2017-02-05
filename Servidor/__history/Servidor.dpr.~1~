program Servidor;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UnitServidor_Principal in 'UnitServidor_Principal.pas' {Servidor_Principal},
  UnitServidor_Principal_Metodos in 'UnitServidor_Principal_Metodos.pas' {Servidor_Principal_Metodos: TDSServerModule},
  UnitServidor_Principal_Container in 'UnitServidor_Principal_Container.pas' {Servidor_Principal_Container: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServidor_Principal, Servidor_Principal);
  Application.CreateForm(TServidor_Principal_Container, Servidor_Principal_Container);
  Application.Run;
end.

