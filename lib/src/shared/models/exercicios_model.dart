class ExerciciosModel {
  final int id;
  final String colaborador;
  final String supervisor;
  final bool isAgendadas;
  final DateTime exercicioInicial;
  final DateTime exercicioFinal;
  final DateTime dataLimite;
  final DateTime dataRegistro;

  ExerciciosModel({
    required this.id,
    required this.colaborador,
    required this.supervisor,
    required this.isAgendadas,
    required this.exercicioInicial,
    required this.exercicioFinal,
    required this.dataLimite,
    required this.dataRegistro,
  });
}
