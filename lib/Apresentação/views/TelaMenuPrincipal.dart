import 'package:flutter/material.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaBuscarCompativeis.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaLogin.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaMeuPerfil.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaMinhasPermutas.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaNotificacaoPermuta.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaRealizarPermuta.dart';
import '../../Logica/Models/Funcionario.dart';

class MenuPrincipal extends StatelessWidget{
  final Funcionario funcionario;

  const MenuPrincipal({Key? key,required this.funcionario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar:AppBar(
      backgroundColor: Colors.black,
      title: InkWell(onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));

      },child: Text("MOZ PERMUTAS",style: TextStyle(fontSize: 15,color: Color(0xFF3CB371),fontWeight: FontWeight.bold,fontStyle:FontStyle.italic ),)),
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        InkWell(onTap:(){
           Navigator.push(context, MaterialPageRoute(builder: (context) => TelaNotificacaoPermuta(funcionario: funcionario,)));
        },
            child: Icon(Icons.notification_add_rounded)),
        SizedBox(width: 40,),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => TelaMeuPerfilG()));
            },
            borderRadius: BorderRadius.circular(8), // opcional, para o efeito de toque
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  funcionario.nome,
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
          [
            SizedBox(height: 46,),
            Text("MENU PRINCIPAL",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 46,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaRealizarPermuta(funcionario: funcionario),
                  ),
                );
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaMinhasPermutas(funcionario.email)));
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => TelaBuscarCompativeis(funcionario: funcionario,)));
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


