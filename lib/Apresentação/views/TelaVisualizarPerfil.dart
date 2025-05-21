import 'package:flutter/material.dart';

class TelaVisualizarPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PERFIL DO UTILIZADOR",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Color(0xFF003366),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: SizedBox(
                height: 200,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Icon(Icons.account_circle_rounded, color: Color(0xFF3CB371), size: 100),
                      SizedBox(height: 10),
                      Text(
                        "João Mucavel",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Informático",
                        style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.blueGrey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _infoTile(Icons.phone, "Contacto", "+258 84 123 4567"),
                    Divider(color: Colors.white24),
                    _infoTile(Icons.email, "Email", "joao.mucavel@exemplo.com"),
                    Divider(color: Colors.white24),
                    _infoTile(Icons.work, "Local de Trabalho", "Universidade São Tomás"),
                    Divider(color: Colors.white24),
                    _infoTile(Icons.location_city, "Província", "Maputo"),
                    Divider(color: Colors.white24),
                    _infoTile(Icons.location_on, "Distrito", "Kamaxaquene"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF3CB371)),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "$label: $value",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
