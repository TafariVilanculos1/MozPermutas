import 'package:flutter/material.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaMenuPrincipal.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaCriarConta.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 20), // Espaço inicial
              // Parte superior: imagem e título
              Column(
                children: [
                  Image.asset("assets/simboloapp.png", height: 100),
                  SizedBox(height: 10),
                  Text(
                    "BEM VINDO AO MOZ PERMUTAS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 150), // Substitui o Spacer para controlar melhor o espaço

              // Campos de entrada e botões
              TextField(
                decoration: InputDecoration(
                  labelText: "Introduza o seu número de celular",
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Introduza a sua senha",
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPrincipal()));
                  // lógica de login
                },
                child: Text("Entrar", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF3CB371),
                  minimumSize: Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaCriarConta()));
                },
                child: Text("Criar Conta", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF003366),
                  minimumSize: Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),

              SizedBox(height: 12),
            ElevatedButton(
            onPressed: () {
        // Ação ao clicar no botão
      },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: const Size(350, 50),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),// Fundo branco, como o botão típico da Google
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/google_icon.png', // Caminho do ícone da Google (coloque o ficheiro na pasta assets)
              height: 24.0,
            ),
            const SizedBox(width: 12.0),
            const Text("Entrar com Google",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ],
        ),
      )


      ,
              Spacer(), // empurra levemente o conteúdo para cima
            ],
          ),
        ),
      ),
    );
  }
}
