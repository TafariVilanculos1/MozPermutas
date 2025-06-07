import 'package:flutter/material.dart';
import 'package:mozpermutas/Logica/Models/Funcionario.dart';
import 'package:mozpermutas/Logica/Models/NotificacaoPermuta.dart';
import 'package:mozpermutas/Logica/Servicos/NotificacaoService.dart';

class TelaNotificacaoPermuta extends StatefulWidget {
  final Funcionario funcionario;

  const TelaNotificacaoPermuta({Key? key, required this.funcionario}) : super(key: key);

  @override
  State<TelaNotificacaoPermuta> createState() => _TelaNotificacaoPermutaState();
}

class _TelaNotificacaoPermutaState extends State<TelaNotificacaoPermuta> {
  final notificacaoService = NotificacaoService();
  List<NotificacaoPermuta> notificacoes = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarNotificacoes();
  }

  Future<void> carregarNotificacoes() async {
    final lista = await notificacaoService.buscarNotificacoesPorEmail(widget.funcionario.email);
    setState(() {
      notificacoes = lista;
      carregando = false;
    });
  }

  Future<void> responderNotificacao(String id, String status) async {
    await notificacaoService.actualizarStatus(id, status);
    await carregarNotificacoes(); // refrescar lista
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Resposta enviada com sucesso')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notificações de Permutas"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: carregando
          ? Center(child: CircularProgressIndicator())
          : notificacoes.isEmpty
          ? Center(child: Text("Nenhuma notificação recebida."))
          : ListView.builder(
        itemCount: notificacoes.length,
        itemBuilder: (context, index) {
          final notificacao = notificacoes[index];
          return Card(
            margin: EdgeInsets.all(10),
            color: Color(0xFF003366),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.notifications_active, color: Colors.amber, size: 40),
                  SizedBox(height: 10),
                  Text(
                    "Proposta de permuta recebida de:",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    notificacao.remetenteEmail,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Estado: ${notificacao.status}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  if (notificacao.status == 'pendente') ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () =>
                              responderNotificacao(notificacao.id, 'emparelhado'),
                          icon: Icon(Icons.check),
                          label: Text("Aceitar"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () =>
                              responderNotificacao(notificacao.id, 'recusada'),
                          icon: Icon(Icons.cancel),
                          label: Text("Recusar"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
