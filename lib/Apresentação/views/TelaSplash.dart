import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mozpermutas/Apresentação/views/TelaLogin.dart';

class TelaSplash extends StatefulWidget {
  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  @override
  void initState() {
    super.initState();

    // Timer para ir para próxima tela após 3 segundos
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaLogin()), // Substitua pela sua tela principal
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Image.asset(
            'assets/simboloapp.png',
            width: 200, // ajuste conforme necessário
          ), Text("MOZ PERMUTAS")],
        ),
      ),
    );
  }
}

