import 'package:supabase_flutter/supabase_flutter.dart';

class ServicoDadosDropdown {
  final supabase = Supabase.instance.client;

  Future<List<String>> carregarEmpresas() async {
    final response = await supabase.from('empresas').select('nome');
    return response.map((e) => e['nome'] as String).toList();
  }

  Future<List<String>> carregarProfissoesPorEmpresa(String nomeEmpresa) async {
    final supabase = Supabase.instance.client;

    // 1. Buscar o ID da empresa
    final empresa = await supabase
        .from('empresas')
        .select('id')
        .eq('nome', nomeEmpresa)
        .single();

    final empresaId = empresa['id'];

    // 2. Buscar profissões associadas via empresa_profissoes
    final response = await supabase
        .from('empresa_profissoes')
        .select('profissoes(nome)')
        .eq('empresa_id', empresaId);

    // 3. Extrair os nomes
    return response.map((e) => e['profissoes']['nome'] as String).toList();
  }


  Future<List<String>> carregarProvincias() async {
    final response = await supabase.from('provincias').select('nome');
    return response.map((e) => e['nome'] as String).toList();
  }

  Future<List<String>> carregarDistritosPorProvincia(String provinciaNome) async {
    final provincia = await supabase
        .from('provincias')
        .select('id')
        .eq('nome', provinciaNome)
        .single();

    final response = await supabase
        .from('distritos')
        .select('nome')
        .eq('provincia_id', provincia['id']);

    return response.map((e) => e['nome'] as String).toList();
  }
}
