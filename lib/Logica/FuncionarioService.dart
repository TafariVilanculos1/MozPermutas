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
}
