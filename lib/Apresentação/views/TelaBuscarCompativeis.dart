import 'package:flutter/material.dart';
import 'package:mozpermutas/Logica/Models/Funcionario.dart';
import 'package:mozpermutas/Logica/Servicos/ServicosPermuta.dart';
import 'package:mozpermutas/Logica/Models/Permuta.dart';
import 'package:mozpermutas/Logica/Models/NotificacaoPermuta.dart';
import 'package:mozpermutas/Logica/Servicos/NotificacaoService.dart';

class TelaBuscarCompativeis extends StatefulWidget {
  final Funcionario funcionario;

  TelaBuscarCompativeis({super.key, required this.funcionario});

  @override
  State<TelaBuscarCompativeis> createState() => _TelaBuscarCompativeisState();
}

class _TelaBuscarCompativeisState extends State<TelaBuscarCompativeis> {
  final servicos = ServicosPermuta();
  final notificacaoService = NotificacaoService();
  List<Permuta> compativeis = [];
  late Permuta? minhaPermuta;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarCompativeis();
  }

  Future<void> carregarCompativeis() async {
    try {
      final minhasPermutas = await servicos.buscarPermutasDoUtilizador(widget.funcionario.email);
      if (minhasPermutas.isEmpty) {
        setState(() {
          carregando = false;
          minhaPermuta = null;
        });
        return;
      }

      minhaPermuta = minhasPermutas.last;
      final encontrados = await servicos.buscarPermutasCompativeis(minhaPermuta!);

      setState(() {
        compativeis = encontrados;
        carregando = false;
      });
    } catch (e) {
      print("Erro: $e");
      setState(() {
        carregando = false;
      });
    }
  }

  Future<void> proporPermuta(Permuta destinatario) async {
    if (minhaPermuta == null) return;

    final notificacao = NotificacaoPermuta(
      id: '',
      remetenteEmail: widget.funcionario.email,
      destinatarioEmail: destinatario.email,
      codigoPermutaRemetente: minhaPermuta!.codigoPermuta,
      codigoPermutaDestinatario: destinatario.codigoPermuta,
      status: 'pendente',
    );

    await notificacaoService.enviarNotificacao(notificacao);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Proposta enviada a ${destinatario.nome}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BUSCAR COMPATÍVEIS"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: carregando
          ? Center(child: CircularProgressIndicator())
          : compativeis.isEmpty
          ? Center(child: Text("Nenhuma permuta compatível encontrada."))
          : ListView.builder(
        itemCount: compativeis.length,
        itemBuilder: (context, index) {
          final permuta = compativeis[index];
          return Card(
            color: Color(0xFF003366),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Icon(Icons.account_circle_rounded, size: 80, color: Color(0xFF3CB371)),
                  SizedBox(height: 8),
                  Text("Nome: ${permuta.nome}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("Província Actual: ${permuta.provinciaActual}", style: TextStyle(color: Colors.white)),
                  Text("Deseja: ${permuta.provinciaDesejada}", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => proporPermuta(permuta),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3CB371),
                      foregroundColor: Colors.white,
                      minimumSize: Size(250, 40),
                    ),
                    child: Text("Propor Permuta"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
