import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaMenuPrincipal.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaCriarConta.dart';
import 'package:mozpermutas/Logica/AutenticacaoFireBase.dart';

import '../../Logica/FuncionarioService.dart';

class TelaLogin extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final AutenticacaoFirebase atfb = AutenticacaoFirebase();

  @override
  Widget build(BuildContext context) {
    final alturaEcra = MediaQuery.of(context).size.height;

    return Scaffold(
    body: SafeArea(
    child: SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    child: ConstrainedBox(
    constraints: BoxConstraints(minHeight: alturaEcra),
    child: IntrinsicHeight(
    child: Column(
    children: [
    SizedBox(height: 40),
    // Logotipo e título
    Column(
    children: [
    Image.asset("assets/simboloapp.png", height: 100),
    SizedBox(height: 10),
    Text(
    "BEM-VINDO AO MOZ PERMUTAS",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Color(0xFF003366),
    ),
    textAlign: TextAlign.center,
    ),
    ],
    ),
    SizedBox(height: 60),

    // Formulário de login
    TextField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
    labelText: "Email",
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.email),
    ),
    ),
    SizedBox(height: 16),
    TextField(
    controller: _senhaController,
    obscureText: true,
    decoration: InputDecoration(
    labelText: "Senha",
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.lock),
    ),
    ),
    SizedBox(height: 32),

    // Botão de login
    ElevatedButton(
      onPressed: () async {
        String email = _emailController.text.trim();
        String senha = _senhaController.text.trim();

        String? mensagem = await atfb.loginUtilizador(email: email, senha: senha);

        if (mensagem == 'Login efectuado com sucesso.') {
          final userEmail = FirebaseAuth.instance.currentUser?.email;

          if (userEmail != null) {
            FuncionarioService funcionarioService = FuncionarioService();
            final funcionario = await funcionarioService.buscarFuncionarioPorEmail(userEmail);

            if (funcionario != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPrincipal(funcionario: funcionario),
                ),
              );
              return;
            }
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao carregar dados do utilizador.'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(mensagem ?? 'Erro desconhecido.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
      ,
    child: Text("Entrar",
    style: TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold)),
    style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF3CB371),
    foregroundColor: Colors.white,
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
    SizedBox(height: 12),

    // Botão para criar conta
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => TelaCriarConta()),
    );
    },
    child: Text("Criar Conta",
    style: TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold)),
    style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF003366),
    foregroundColor: Colors.white,
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
    SizedBox(height: 24),
    Spacer(),
    ],
    ),
    ),
    ),
    ),
    ),
    );
    }
}

