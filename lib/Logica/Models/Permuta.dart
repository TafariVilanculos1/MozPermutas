class Permuta {
  final String codigoPermuta;
  final String nome;
  final String email;
  final String empresa;
  final String profissao;
  final String provinciaActual;
  final String distritoActual;
  final String provinciaDesejada;
  final String distritoDesejado;
  final String motivo;
  final String statuts; // Verifica se não seria 'status' (erro de digitação?)

  Permuta({
    required this.codigoPermuta,
    required this.nome,
    required this.email,
    required this.empresa,
    required this.profissao,
    required this.provinciaActual,
    required this.distritoActual,
    required this.provinciaDesejada,
    required this.distritoDesejado,
    required this.motivo,
    required this.statuts,
  });

  // Converter de Map para objeto
  factory Permuta.fromMap(Map<String, dynamic> map) {
    return Permuta(
      codigoPermuta: map['codigo_permuta'],
      nome: map['nome'],
      email: map['email'],
      empresa: map['empresa'],
      profissao: map['profissao'],
      provinciaActual: map['provincia_actual'],
      distritoActual: map['distrito_actual'],
      provinciaDesejada: map['provincia_desejada'],
      distritoDesejado: map['distrito_desejado'],
      motivo: map['motivo'],
      statuts: map['statuts'],
    );
  }

  // Converter de objeto para Map (para guardar no Supabase)
  Map<String, dynamic> toMap() {
    return {
      'codigo_permuta': codigoPermuta,
      'nome': nome,
      'email': email,
      'empresa': empresa,
      'profissao': profissao,
      'provincia_actual': provinciaActual,
      'distrito_actual': distritoActual,
      'provincia_desejada': provinciaDesejada,
      'distrito_desejado': distritoDesejado,
      'motivo': motivo,
      'statuts': statuts,
    };
  }
}
