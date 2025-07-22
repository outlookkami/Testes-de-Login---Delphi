program TesteLogin;

{$APPTYPE CONSOLE}

{$R *.res}

uses System.SysUtils;

procedure MostrarMenu;
begin
  // Menu
    WriteLn('----------- Menu -----------');
    WriteLn('| 1 - Fazer Login           |');
    WriteLn('| 2 - Cadastrar             |');
    WriteLn('| 9 - Sair                  |');
    WriteLn('----------------------------');
    WriteLn('Digite sua opção de destino:');
end;

const usuarioAdmin: String = 'Admin';
      senhaAdmin: String = 'Admin';

function LoginValido(usuario, senha: String): Boolean;
begin
      Result := (usuario = usuarioAdmin) and (senha = senhaAdmin);
end;

var nome, email, senhaCad, senhaConf: String;

procedure CadastroInfo;
begin

         Write('Informe seu nome: ');
         ReadLn(nome);
         Write('Informe seu email: ');
         ReadLn(email);
         Write('Crie uma senha: ');
         ReadLn(senhaCad);
         Write('Confirme a senha: ');
         ReadLn(senhaConf);
end;

function CadastroValido(senhaCad, senhaConf: String): Boolean;
begin
      Result := (senhaConf = senhaCad);
end;

// Criar uma funcionalidade de login a partir de dados informados por um usuário.
// - Usuário - Senha
// Funcionalidade: confirmar o acesso

var usuario, senha, opcaoDeDestino: String;
    controle: Boolean;

begin
  try
    // Menu
    controle := true;

    while controle do begin
      MostrarMenu;
      ReadLn(opcaoDeDestino);
      if (opcaoDeDestino = '9') then begin
          WriteLn('Encerrando...');
          Sleep(1500);
          exit;
      end else if(opcaoDeDestino = '1') then begin
        WriteLn('Digite seu Usuário: ');
        ReadLn(usuario);
        WriteLn('Digite sua senha: ');
        ReadLn(senha);

        if LoginValido(usuario, senha) then begin
          WriteLn('Login efetuado com sucesso!');
          controle := false;
        end else begin
          WriteLn('Credenciais incorretas, tente novamente.');
          Sleep(1500);
          Write(sLineBreak);
          end;

        end else if(opcaoDeDestino = '2') then begin
          while True do begin
            CadastroInfo;
            if CadastroValido(senhaCad, senhaConf) then begin
              WriteLn('Um email de verificação foi enviado para ', email);
              controle := false;
              Break;
            end else begin
              Write('Senhas não correspondem. Tente novamente.');
              Sleep(1500);
              Write(sLineBreak);
              Write(sLineBreak);
            end;
          end;
        end;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
