import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mozpermutas/Logica/Models/NotificacaoPermuta.dart';

class NotificacaoService {
  final supabase = Supabase.instance.client;

  Future<void> enviarNotificacao(NotificacaoPermuta notificacao) async {
    await supabase.from('notificacoes').insert(notificacao.toMap());
  }

  Future<List<NotificacaoPermuta>> buscarNotificacoesPorEmail(String email) async {
    final response = await supabase
        .from('notificacoes')
        .select()
        .eq('destinatario_email', email)
        .order('id', ascending: false);

    return response.map((e) => NotificacaoPermuta.fromMap(e)).toList();
  }

  Future<void> actualizarStatus(String id, String novoStatus) async {
    await supabase.from('notificacoes').update({'status': novoStatus}).eq('id', id);
  }
}
