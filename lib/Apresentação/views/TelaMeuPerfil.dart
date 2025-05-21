import 'package:flutter/material.dart';

class TelaMeuPerfilG extends StatefulWidget {
  @override
  TelaMeuPerfil createState() => TelaMeuPerfil();
}

class TelaMeuPerfil extends State<TelaMeuPerfilG> {
  String? localSelecionado;
  String? localProvincia;
  String? localDestrito;
  String? profissao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MEU PERFIL",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Ação ao clicar no botão (por exemplo, navegar para uma tela de edição)
              print("Editar perfil clicado!");
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Card com ícone e botão para foto de perfil
                Card(
                  color: Color(0xFF003366),
                  child: SizedBox(
                    width: 500,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle_rounded, color: Color(0xFF3CB371), size: 100),
                        ElevatedButton(
                          onPressed: () {
                            // ação para adicionar foto
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            "Adicionar Foto de Perfil",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        
                // Card com os inputs
                Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 550,
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Contacto do utilizador",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF003366)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF3CB371)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Nome do Utilizador",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF003366)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF3CB371)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Email do utilizador",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF003366)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF3CB371)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Local de Trabalho",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                          DropdownButtonFormField<String>(
                            value: localSelecionado,
                            dropdownColor: Colors.blueGrey,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
                            hint: Text("Selecione o local", style: TextStyle(color: Colors.white)),
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
                          SizedBox(height: 10),
                          Text("Selecione a sua profissão",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                          DropdownButtonFormField<String>(
                            value: profissao,
                            dropdownColor: Colors.blueGrey,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
                            hint: Text("Seleciona sua profissão", style: TextStyle(color: Colors.white)),
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
                          SizedBox(height: 10),
                          Text("Província",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                          DropdownButtonFormField<String>(
                            value: localProvincia,
                            dropdownColor: Colors.blueGrey,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
                            hint: Text("Selecione a sua província", style: TextStyle(color: Colors.white)),
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
                          SizedBox(height: 10),
                          Text("Distrito",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                          DropdownButtonFormField<String>(
                            value: localDestrito,
                            dropdownColor: Colors.blueGrey,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
                            hint: Text("Selecione o seu distrito", style: TextStyle(color: Colors.white)),
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
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Ação para editar conta
                    print("Conta apagada");
                  },
                  icon: Icon(Icons.edit, color: Colors.white),
                  label: Text("Ediar Conta", style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    backgroundColor: Color(0xFF003366),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                ),
                // Botão "Apagar Conta"
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Ação para apagar conta
                    print("Conta apagada");
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text("Apagar Conta", style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
