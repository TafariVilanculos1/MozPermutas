import 'package:flutter/material.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaBuscarCompativeis.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaMinhasPermutas.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaRealizarPermuta.dart';

class MenuPrincipal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar:AppBar(
      backgroundColor: Colors.black,
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              // Aqui vai o evento, como navegar para outra página
              print('Perfil clicado');
              // Exemplo: Navigator.pushNamed(context, '/perfil');
            },
            borderRadius: BorderRadius.circular(8), // opcional, para o efeito de toque
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Meu Perfil',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    ),

    body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:
          [Text("MENU PRINCIPAL",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 46,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaRealizarPermuta()));
              },
              child: Text("REALIZAR PERMUTA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF003366),
                minimumSize: Size(357, 143),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 45,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaMinhasPermutas()));
              },
              child: Text("MINHAS PERMUTAS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF003366),
                minimumSize: Size(357, 143),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 45,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => TelaBuscarCompativeis()));
              },
              child: Text("BUSCAR COMPATÍVEIS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF003366),
                minimumSize: Size(357, 143),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
           ]
          ),
        ),
      ),
    );
  }

}