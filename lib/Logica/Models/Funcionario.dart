class Funcionario {
  final String nome;
  final String email;
  final String celular;
  final String empresa; // ← nome
  final String empresaId; // ← novo campo
  final String profissao;
  final String provincia;
  final String distrito;
  final String senha;

  Funcionario({
    required this.nome,
    required this.email,
    required this.celular,
    required this.empresa,
    required this.empresaId, // ← novo campo
    required this.profissao,
    required this.provincia,
    required this.distrito,
    required this.senha,
  });

  factory Funcionario.fromMap(Map<String, dynamic> map) {
    return Funcionario(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      celular: map['celular'] ?? '',
      empresa: map['empresa'] ?? '',
      empresaId: map['empresa_id'] ?? '', // ← novo
      profissao: map['profissao'] ?? '',
      provincia: map['provincia'] ?? '',
      distrito: map['distrito'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'celular': celular,
      'empresa': empresa,
      'empresa_id': empresaId, // ← novo
      'profissao': profissao,
      'provincia': provincia,
      'distrito': distrito,
      'senha': senha,
    };
  }
}
