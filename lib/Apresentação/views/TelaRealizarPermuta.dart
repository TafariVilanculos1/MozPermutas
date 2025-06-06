import 'package:flutter/material.dart';
import 'package:mozpermutas/Logica/Models/Permuta.dart';
import 'package:mozpermutas/Logica/Servicos/ServicosPermuta.dart';
import '../../Logica/Models/Funcionario.dart';

class TelaRealizarPermuta extends StatefulWidget
{
  final Funcionario funcionario;

  const TelaRealizarPermuta({Key? key, required this.funcionario}) : super(key: key);
  @override
  TelaRealizarPermutaState createState() => TelaRealizarPermutaState(funcionario);

}

class TelaRealizarPermutaState extends State<TelaRealizarPermuta>
{
  Funcionario funcionario;

  TelaRealizarPermutaState(this.funcionario);
  String? provinciaDesejada;
  String? destritoDesejado;
  String? motivoPermuta;

  List<String> provincias = [];
  List<String> distritos = [];

  ServicosPermuta srvp = ServicosPermuta();

  @override
  void initState() {
    super.initState();
    carregarDadosIniciais();
  }

  Future<void> carregarDadosIniciais() async {
    final listaProvincias = await srvp.buscarProvincias(funcionario.empresa);
    final listaDistritos = await srvp.buscarDistritos(funcionario.empresa);

    setState(() {
      provincias = listaProvincias;
      distritos = listaDistritos;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       appBar: AppBar(

         title: Text("REALIZAR PERMUTA", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
         centerTitle: true,
         backgroundColor: Colors.black,
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
                       SizedBox(width: 10,),
                       Text(funcionario.profissao.toUpperCase(),style: TextStyle(color: Color(0xFF3CB371),fontWeight: FontWeight.w800))
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Empresa:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),)
                          ),
                          SizedBox(width: 10,),
                          Text(funcionario.empresa.toUpperCase(), style: TextStyle(fontSize:16,color: Color(0xFF3CB371),fontWeight: FontWeight.w800),)
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
                        value: provinciaDesejada,
                        hint: Text("Selecione a provincia", style: TextStyle(color: Colors.white)),
                        items: provincias.map((prov) {
                          return DropdownMenuItem(value: prov, child: Text(prov, style: TextStyle(color: Colors.white)));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            provinciaDesejada = value;
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
                     value: destritoDesejado,
                     hint: Text("Selecione o distrito", style: TextStyle(color: Colors.white)),
                     items: distritos.map((dist) {
                       return DropdownMenuItem(value: dist, child: Text(dist, style: TextStyle(color: Colors.white)));
                     }).toList(),
                     onChanged: (value) {
                       setState(() {
                         destritoDesejado = value;
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
                          DropdownMenuItem(value:"Outro",child: Text("Outro...",style: TextStyle(color: Colors.white))),
                        ], onChanged: (value){
                        setState(() {
                          motivoPermuta = value;
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
           ElevatedButton(
             onPressed: () async {
               if (provinciaDesejada != null && destritoDesejado != null && motivoPermuta != null) {
                 Permuta permuta = Permuta(codigoPermuta: srvp.gerarCodigoPermuta(), nome:funcionario.nome , email: funcionario.email, empresa: funcionario.empresa, profissao: funcionario.profissao, provinciaActual: funcionario.provincia, distritoActual: funcionario.distrito, provinciaDesejada: provinciaDesejada!, distritoDesejado: destritoDesejado!, motivo: motivoPermuta!, statuts: "Pendente");
                 try {
                   await srvp.guardarPedidoPermuta(
                     permuta
                   );
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('Pedido enviado com sucesso!')),
                   );
                 } catch (e) {
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('Erro: $e')),
                   );
                 }
               } else {
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text('Preencha todos os campos!')),
                 );
               }
             },
             child: Text(
               "Enviar Pedido",
               style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
             ),
             style: ElevatedButton.styleFrom(
               foregroundColor: Colors.white,
               backgroundColor: Color(0xFF3CB371),
               minimumSize: Size(250, 50),
             ),
           )

         ],
       ),
     );
  }

}

