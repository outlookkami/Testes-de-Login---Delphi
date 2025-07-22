unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
    TfrmLogin = class(TForm)
    Painel: TPanel;
    Image1: TImage;
    pnlFrame: TPanel;
    lblLogin: TLabel;
    btnEntrar: TButton;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    Image2: TImage;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario: String;
    senha: String;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  usuario:= 'admin';
  senha := '12345';
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
     if (txtUsuario.Text = usuario) and (txtSenha.Text = senha) then begin
       ShowMessage('Login efetuado com sucesso!');
     end else begin
      ShowMessage('Usuário ou Senha incorreta. Tente novamente.');
     end;
end;

end.
