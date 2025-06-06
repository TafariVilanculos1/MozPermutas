import 'package:mozpermutas/Logica/Models/Permuta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Models/Funcionario.dart';

class ServicosPermuta {
  final supabase = Supabase.instance.client;

  Future<List<String>> buscarProvincias(String nomeEmpresa) async {
    // Obter o ID da empresa
    final empresa = await supabase
        .from('empresas')
        .select('id')
        .eq('nome', nomeEmpresa)
        .single();
    final empresaId = empresa['id'];

    // Obter províncias associadas à empresa
    final response = await supabase
        .from('empresa_provincias')
        .select('provincias(nome)')
        .eq('empresa_id', empresaId);

    return response.map((e) => e['provincias']['nome'] as String).toList();
  }

  Future<List<String>> buscarDistritos(String nomeEmpresa) async {
    // Obter o ID da empresa
    final empresa = await supabase
        .from('empresas')
        .select('id')
        .eq('nome', nomeEmpresa)
        .single();
    final empresaId = empresa['id'];

    // Obter distritos associados à empresa
    final response = await supabase
        .from('empresa_distritos')
        .select('distritos(nome)')
        .eq('empresa_id', empresaId);

    return response.map((e) => e['distritos']['nome'] as String).toList();
  }

  Future<List<String>> buscarDistritosPorEmpresaEProvincia(String nomeEmpresa, String nomeProvincia) async {
    final empresa = await supabase
        .from('empresas')
        .select('id')
        .eq('nome', nomeEmpresa)
        .single();
    final empresaId = empresa['id'];

    final provincia = await supabase
        .from('provincias')
        .select('id')
        .eq('nome', nomeProvincia)
        .single();
    final provinciaId = provincia['id'];

    final response = await supabase
        .from('empresa_distritos')
        .select('distritos(nome)')
        .eq('empresa_id', empresaId)
        .eq('provincia_id', provinciaId);

    return response.map((e) => e['distritos']['nome'] as String).toList();
  }


  Future<void> guardarPedidoPermuta( Permuta p
  ) async {
    final codigo = gerarCodigoPermuta();

    final dados = {
      'codigo_permuta': codigo,
      'nome': p.nome,
      'email': p.email,
      'empresa': p.empresa,
      'profissao': p.profissao,
      'provincia_actual': p.provinciaActual,
      'distrito_actual': p.distritoActual,
      'provincia_desejada': p.provinciaDesejada,
      'distrito_desejado': p.distritoDesejado,
      'motivo': p.motivo,
      'data_pedido': DateTime.now().toIso8601String(),
      'statuts':p.statuts,
    };

    try {
      await supabase.from('pedidos_permuta').insert(dados);
    } catch (e) {
      throw Exception('Erro ao guardar pedido: $e');
    }
  }

  String gerarCodigoPermuta() {
    final agora = DateTime.now();
    return 'PERMUTA-${agora.millisecondsSinceEpoch}';
  }

  //Seriviços Minha Permuta
  Future<List<Permuta>> buscarPermutasDoUtilizador(String email) async {

    if (email == null) {
      throw Exception('Utilizador não autenticado');
    }

    final response = await Supabase.instance.client
        .from('pedidos_permuta')
        .select()
        .eq('email', email);

    return (response as List)
        .map((map) => Permuta.fromMap(map as Map<String, dynamic>))
        .toList();
  }

  // Cancelar Permuta
  Future<void> cancelarPermuta(String codigoPermuta) async {
    final response = await supabase
        .from('pedidos_permuta')
        .delete()
        .eq('codigo_permuta', codigoPermuta);


  }



}
