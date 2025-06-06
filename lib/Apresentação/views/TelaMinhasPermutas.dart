import 'package:flutter/material.dart';
import '../../Logica/Models/Permuta.dart';
import 'package:mozpermutas/Logica/Servicos/ServicosPermuta.dart';
 // ou o caminho onde colocaste a função buscarPermutasDoUtilizador

class TelaMinhasPermutas extends StatelessWidget {
  String email;
  TelaMinhasPermutas(this.email);
  ServicosPermuta servicosPermuta = ServicosPermuta();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MINHAS PERMUTAS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(width: 8),
            Image.asset('assets/simboloapp.png', height: 30),
          ],
        ),
      ),
      body: FutureBuilder<List<Permuta>>(
        future: servicosPermuta.buscarPermutasDoUtilizador(email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma permuta encontrada.'));
          }

          final permutas = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: permutas.length,
            itemBuilder: (context, index) {
              final p = permutas[index];
              return Card(
                color: Color(0xFF003366),
                margin: EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLinha("Código do Pedido:", p.codigoPermuta),
                      buildLinha("Profissão Permuta:", p.profissao, corTexto: Color(0xFF3CB371)),
                      buildLinha("Local actual de trabalho:", p.provinciaActual, corTexto: Color(0xFF3CB371)),
                      buildLinha("Local Desejado:", p.provinciaDesejada, corTexto: Color(0xFF3CB371)),
                      buildLinha("Status Permuta:", p.statuts, corTexto: Color(0xFF3CB371)),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () async {
                          final confirmacao = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Cancelar Pedido"),
                              content: Text("Tens a certeza que desejas cancelar este pedido?"),
                              actions: [
                                TextButton(
                                  child: Text("Não"),
                                  onPressed: () => Navigator.pop(context, false),
                                ),
                                TextButton(
                                  child: Text("Sim"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            ),
                          );

                          if (confirmacao == true) {
                            try {
                              await servicosPermuta.cancelarPermuta(p.codigoPermuta);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Permuta cancelada com sucesso!")),
                              );

                              // Recarrega a tela para atualizar a lista
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => TelaMinhasPermutas(email)),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Erro ao cancelar permuta: $e")),
                              );
                            }
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(350, 50),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("CANCELAR PEDIDO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildLinha(String titulo, String valor, {Color corTexto = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: TextStyle(color: corTexto, fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(width: 8),
          Expanded(
            child: Text(valor, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
