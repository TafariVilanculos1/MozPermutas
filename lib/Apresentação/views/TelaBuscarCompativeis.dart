import 'package:flutter/material.dart';
import 'package:mozpermutas/Apresenta%C3%A7%C3%A3o/views/TelaVisualizarPerfil.dart';

class TelaBuscarCompativeis extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("BUSCAR COMPATÍVEIS", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(width: 8),
            Image.asset('assets/simboloapp.png',height: 30,),
          ],
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Color(0xFF003366),
                child: SizedBox(
                  height: 300,
                  width: 375,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Icon(Icons.account_circle_rounded,size: 100,color: Color(0xFF3CB371),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Nome:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          SizedBox(width: 10,),
                          Text("kkkkk",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      ElevatedButton(onPressed: (){},
                          child: Text("Propor Permuta",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(250, 50),
                          backgroundColor: Color(0xFF3CB371),
                          foregroundColor: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaVisualizarPerfil()));
                      },
                        child: Text("Ver Perfil",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(250, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}