class Funcionario {
  final String nome;
  final String email;
  final String celular;
  final String empresa;
  final String profissao;
  final String provincia;
  final String distrito;
  final String senha;

  Funcionario({
    required this.nome,
    required this.email,
    required this.celular,
    required this.empresa,
    required this.profissao,
    required this.provincia,
    required this.distrito,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'celular': celular,
      'empresa': empresa,
      'profissao': profissao,
      'provincia': provincia,
      'distrito': distrito,
      'senha': senha,
    };
  }
}
