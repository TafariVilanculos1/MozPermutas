import 'package:supabase_flutter/supabase_flutter.dart';

import 'Models/Funcionario.dart';

class FuncionarioService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<bool> adicionarFuncionario(Funcionario funcionario) async {
    try {
      await _supabase
          .from('funcionarios')
          .insert(funcionario.toMap());

      return true;
    } catch (e) {
      print('Erro ao gravar funcionário na Supabase: $e');
      return false;
    }
  }

  Future<Funcionario?> buscarFuncionarioPorEmail(String email) async {
    try {
      final response = await _supabase
          .from('funcionarios')
          .select()
          .eq('email', email)
          .single();

      if (response != null) {
        return Funcionario.fromMap(response);
      }
    } catch (e) {
      print('Erro ao buscar funcionário: $e');
    }
    return null;
  }
}
