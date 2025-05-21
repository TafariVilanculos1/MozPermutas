import 'package:flutter/material.dart';

class TelaRealizarPermuta extends StatefulWidget
{
  @override
  TelaRealizarPermutaState createState() => TelaRealizarPermutaState();

}

class TelaRealizarPermutaState extends State<TelaRealizarPermuta>
{

  String? provinciaDesejada;
  String? destritoDesejado;
  String? motivoPermuta;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       appBar: AppBar(

         title: Text("REALIZAR PERMUTA", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
         centerTitle: true,
         backgroundColor: Color(0xFF003366),
         foregroundColor: Colors.white,
         bottom: PreferredSize(
           preferredSize: Size.fromHeight(1.0),
           child: Container(
             color: Colors.grey, // Cor da borda
             height: 1.0,         // Espessura da borda
           ),
         ),

       ),

       body: Column(
         children: [
           Padding(padding: EdgeInsets.all(16),
               child: Card(
                 color: Color(0xFF003366),
                 child: SizedBox(
                   width: 360,
                   height: 450,
                   child: Padding(padding: EdgeInsets.all(16),
                     child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Profissão:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),)
                          ),
                       Text("    kk",style: TextStyle(color: Color(0xFF3CB371),fontWeight: FontWeight.w800))
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Local de Trabalho:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),)
                          ),
                          Text("    kkk", style: TextStyle(color: Color(0xFF3CB371),fontWeight: FontWeight.w800),)
                        ],
                      ),

                      SizedBox(height: 15),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Provincia Desejada",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),)
                      ),
                      SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.black,
                          value:provinciaDesejada,
                          hint: Text("Selecione a pronvincia",style: TextStyle(color: Colors.white),),
                          items: const[
                            DropdownMenuItem(value:"Maputo",child: Text("Maputo",style: TextStyle(color: Colors.white),)),
                            DropdownMenuItem(value:"Gaza",child: Text("Gaza",style: TextStyle(color: Colors.white))),
                          ], onChanged: (value){
                            setState(() {
                              value=provinciaDesejada;
                            });
                      },

                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF3CB371), width: 2),
                            )
                        ),


                      ),
                      SizedBox(height: 15),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Destrito Desejado",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),)
                      ),
                      SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.black,
                        value:destritoDesejado,
                        hint: Text("Selecione o destrito",style: TextStyle(color: Colors.white)),
                        items: const[
                          DropdownMenuItem(value:"Kanfumo",child: Text("Kanfumo",style: TextStyle(color: Colors.white),)),
                          DropdownMenuItem(value:"Kamaxaquene",child: Text("Kamaxaquene",style: TextStyle(color: Colors.white))),
                        ], onChanged: (value){
                        setState(() {
                          value=destritoDesejado;
                        });
                      },

                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF3CB371), width: 2),
                            )
                        ),

                      ),
                      SizedBox(height: 16,),
                      Text("Motivo da Permuta",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 16,),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.black,
                        value: motivoPermuta,
                        hint: Text("Selecione o motivo",style: TextStyle(color: Colors.white)),
                        items: const[
                          DropdownMenuItem(value:"Doênça",child: Text("Doênca",style: TextStyle(color: Colors.white),)),
                          DropdownMenuItem(value:"Familiar",child: Text("Familiar",style: TextStyle(color: Colors.white))),
                        ], onChanged: (value){
                        setState(() {
                          value= motivoPermuta;
                        });
                      },

                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF3CB371), width: 2),
                            )
                        ),

                      ),

                    ],
                               ), ),
                 )
               )
           ),
           ElevatedButton(onPressed: (){
             //Minha querida Logica
           },
               child: Text("Enviar Pedido" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),),
               style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.white,
                 backgroundColor: Color(0xFF3CB371),
                 minimumSize:Size(250, 50)
               )


           )
         ],
       ),
     );
  }

}