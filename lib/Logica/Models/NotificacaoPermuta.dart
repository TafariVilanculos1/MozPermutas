class NotificacaoPermuta {
  final String id;
  final String remetenteEmail;
  final String destinatarioEmail;
  final String codigoPermutaRemetente;
  final String codigoPermutaDestinatario;
  final String status; // 'pendente', 'aceite', 'recusada', 'emparelhado'

  NotificacaoPermuta({
    required this.id,
    required this.remetenteEmail,
    required this.destinatarioEmail,
    required this.codigoPermutaRemetente,
    required this.codigoPermutaDestinatario,
    required this.status,
  });

  factory NotificacaoPermuta.fromMap(Map<String, dynamic> map) {
    return NotificacaoPermuta(
      id: map['id'] ?? '',
      remetenteEmail: map['remetente_email'],
      destinatarioEmail: map['destinatario_email'],
      codigoPermutaRemetente: map['codigo_permuta_remetente'],
      codigoPermutaDestinatario: map['codigo_permuta_destinatario'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'remetente_email': remetenteEmail,
      'destinatario_email': destinatarioEmail,
      'codigo_permuta_remetente': codigoPermutaRemetente,
      'codigo_permuta_destinatario': codigoPermutaDestinatario,
      'status': status,
    };
  }
}
