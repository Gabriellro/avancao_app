class UserModel {
  final int? id;
  final String nome;
  final String sobrenome;
  final String senha;
  final String email;
  final int? nivel;
  final String regime;
  final String contrato;
  final int? ativo;
  final DateTime admissao;
  final DateTime cadastro;
  final String equipe;
  final int? cargo;
  final String contato;
  final int? dadosSensiveis;
  final String equipesGestor;
  final int? grupoDeUsuario;

  UserModel({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.senha,
    required this.email,
    required this.nivel,
    required this.regime,
    required this.contrato,
    required this.ativo,
    required this.admissao,
    required this.cadastro,
    required this.equipe,
    required this.cargo,
    required this.contato,
    required this.dadosSensiveis,
    required this.equipesGestor,
    required this.grupoDeUsuario,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?, // Use 'as int?' to indicate it can be null.
      nome: map['nome'] as String,
      sobrenome: map['sobrenome'] as String,
      senha: map['senha'] as String,
      email: map['email'] as String,
      nivel: map['nivel'] as int?,
      regime: map['regime'] as String,
      contrato: map['contrato'] as String,
      ativo: map['ativo'] as int?,
      admissao: DateTime.tryParse(map['admissao']) ?? DateTime.now(),
      cadastro: DateTime.tryParse(map['cadastro']) ?? DateTime.now(),
      equipe: map['equipe'] as String,
      cargo: map['cargo'] as int?,
      contato: map['contato'] as String,
      dadosSensiveis: map['dados_sensiveis'] as int?,
      equipesGestor: map['equipes_gestor'] as String,
      grupoDeUsuario: map['grupo_de_usuario'] as int?,
    );
  }
}
