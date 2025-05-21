import 'package:flutter/material.dart';

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
                  height: 219,
                  width: 375,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}