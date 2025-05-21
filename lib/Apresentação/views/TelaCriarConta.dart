import 'package:flutter/material.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaMenuPrincipal.dart';

class TelaCriarConta extends StatefulWidget {
  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}

class _TelaCriarContaState extends State<TelaCriarConta> {
  String? localSelecionado;
  String? localProvincia;
  String? localDestrito;
  String? profissao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF003366),
        foregroundColor:Colors.white
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // ocupa largura total
              children: [
                SizedBox(height: 10),
                Text(
                  "CRIE A SUA CONTA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "MOZ PERMUTAS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Introduza o seu número de celular",
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Introduza o seu nome e apelido",
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Introduza o seu email",
                  ),
                ),
                SizedBox(height: 20),
                Text("Local de Trabalho",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                DropdownButtonFormField<String>(
                  value: localSelecionado,
                  hint: Text("Selecione o local"),
                  items: const [
                    DropdownMenuItem(value: "USTM", child: Text("Universidade São Tomás")),
                    DropdownMenuItem(value: "Mozal", child: Text("Mozal")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      localSelecionado = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text("Selecione a sua profissão",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                DropdownButtonFormField<String>(
                  value: localSelecionado,
                  hint: Text("Seleciona sua profissão"),
                  items: const [
                    DropdownMenuItem(value: "Informatico", child: Text("Informatico")),
                    DropdownMenuItem(value: "Enfermeiro", child: Text("Enfermeiro")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      profissao = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text("Província", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                DropdownButtonFormField<String>(
                  value: localProvincia,
                  hint: Text("Selecione a sua província"),
                  items: const [
                    DropdownMenuItem(value: "Maputo", child: Text("Maputo")),
                    DropdownMenuItem(value: "Gaza", child: Text("Gaza")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      localProvincia = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text("Distrito", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                DropdownButtonFormField<String>(
                  value: localDestrito,
                  hint: Text("Selecione o seu distrito"),
                  items: const [
                    DropdownMenuItem(value: "Kanfumo", child: Text("Kanfumo")),
                    DropdownMenuItem(value: "Kamaxaquene", child: Text("Kamaxaquene")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      localDestrito = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: "Crie a sua senha"),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: "Confirme a sua senha"),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPrincipal()));
                  },
                  child: Text("Criar Conta", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF3CB371),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
