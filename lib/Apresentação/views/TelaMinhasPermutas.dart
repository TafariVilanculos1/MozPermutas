import 'package:flutter/material.dart';

class TelaMinhasPermutas extends StatelessWidget
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
          mainAxisSize: MainAxisSize.min, // importante para centralizar
          children: [
            Text(
              'MINHA PERMUTAS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(width: 8),
            Image.asset('assets/simboloapp.png', height: 30),
          ],
        ),
      ),

      body: Center(
        child: Padding(padding: EdgeInsets.all(16),
          child: SizedBox(
            child: Column(
              children: [Card(
                color: Color(0xFF003366),
                child: SizedBox(
                    width: 360,
                    height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Código do Pedido:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Profissão Permuta:",style: TextStyle(color:Color(0xFF3CB371),fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Local actual de trabalho:",style: TextStyle(color:Color(0xFF3CB371),fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Local Desejado:",style: TextStyle(color:Color(0xFF3CB371),fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Data Pedido:",style: TextStyle(color:Color(0xFF3CB371),fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Status Permuta:",style: TextStyle(color:Color(0xFF3CB371),fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Funcionário Pareado:",style: TextStyle(color:Color(0xFF3CB371),fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Text("kkkkkk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
                ElevatedButton(onPressed: (){},
                    child: Text("CANCELAR PEDIDO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white

                  ),
                )
              
              ],
            ),
          ),
        ),
      ),

    );
  }


}