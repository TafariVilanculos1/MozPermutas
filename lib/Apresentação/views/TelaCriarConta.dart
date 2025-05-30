import 'package:flutter/material.dart';
import 'package:mozpermutas/Logica/AutenticacaoFireBase.dart';
import '../../Logica/FuncionarioService.dart';
import '../../Logica/Models/Funcionario.dart';
import '../../Logica/ServicoDadosDropdown.dart';


class TelaCriarConta extends StatefulWidget {
  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}
class _TelaCriarContaState extends State<TelaCriarConta> {
  String? empresaSelecionada;
  String? profissaoSelecionada;
  String? provinciaSelecionada;
  String? distritoSelecionado;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();

  AutenticacaoFirebase atfb = AutenticacaoFirebase();
  ServicoDadosDropdown servico = ServicoDadosDropdown();

  List<String> empresas = [];
  List<String> profissoes = [];
  List<String> provincias = [];
  List<String> distritos = [];

  @override
  void initState() {
    super.initState();
    carregarEmpresas();
    carregarProvincias();
  }

  Future<void> carregarEmpresas() async {
    final resultado = await servico.carregarEmpresas();
    setState(() {
      empresas = resultado;
    });
  }

  Future<void> carregarProvincias() async {
    final resultado = await servico.carregarProvincias();
    setState(() {
      provincias = resultado;
    });
  }

  Future<void> carregarProfissoes(String empresa) async {
    final resultado = await servico.carregarProfissoesPorEmpresa(empresa);
    setState(() {
      profissoes = resultado;
      profissaoSelecionada = null;
    });
  }

  Future<void> carregarDistritos(String provincia) async {
    final resultado = await servico.carregarDistritosPorProvincia(provincia);
    setState(() {
      distritos = resultado;
      distritoSelecionado = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF003366),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _celularController,
                decoration: InputDecoration(labelText: "Número de celular"),
              ),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome completo"),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: empresaSelecionada,
                hint: Text("Selecione a empresa"),
                items: empresas.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) {
                  setState(() {
                    empresaSelecionada = value;
                    profissaoSelecionada = null;
                    profissoes.clear();
                  });
                  carregarProfissoes(value!);
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: profissaoSelecionada,
                hint: Text("Selecione a profissão"),
                items: profissoes.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                onChanged: (value) {
                  setState(() {
                    profissaoSelecionada = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: provinciaSelecionada,
                hint: Text("Selecione a província"),
                items: provincias.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                onChanged: (value) {
                  setState(() {
                    provinciaSelecionada = value;
                    distritoSelecionado = null;
                    distritos.clear();
                  });
                  carregarDistritos(value!);
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: distritoSelecionado,
                hint: Text("Selecione o distrito"),
                items: distritos.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                onChanged: (value) {
                  setState(() {
                    distritoSelecionado = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
              ),
              TextField(
                controller: _confirmaSenhaController,
                decoration: InputDecoration(labelText: "Confirmar senha"),
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text.trim();
                  String senha = _senhaController.text.trim();
                  String confirmarSenha = _confirmaSenhaController.text.trim();

                  // Registar no Firebase Auth
                  String? mensagem = await atfb.cadastrarUtilizador(
                    email: email,
                    senha: senha,
                    confirmarSenha: confirmarSenha,
                  );

                  // Verifica se o registo no Firebase teve sucesso
                  if (mensagem == 'Utilizador registado com sucesso.') {
                    // Criar objeto Funcionario
                    Funcionario funcionario = Funcionario(
                      nome: _nomeController.text.trim(),
                      email: email,
                      celular: _celularController.text.trim(),
                      empresa: empresaSelecionada ?? '',
                      profissao: profissaoSelecionada ?? '',
                      provincia: provinciaSelecionada ?? '',
                      distrito: distritoSelecionado ?? '',
                      senha: senha, // ⚠️ Apenas para demonstração. Ideal: guardar hasheada ou evitar.
                    );

                    // Adicionar na Supabase
                    FuncionarioService servico = FuncionarioService();
                    bool sucesso = await servico.adicionarFuncionario(funcionario);

                    if (sucesso) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Conta criada com sucesso."),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Podes redirecionar o utilizador ou limpar os campos aqui, se quiseres
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Registo no Firebase feito, mas falha ao guardar no Supabase."),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                  } else {
                    // Mostrar erro do Firebase
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(mensagem ?? 'Erro desconhecido.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text("Criar Conta"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


