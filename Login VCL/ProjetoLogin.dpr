program ProjetoLogin;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
