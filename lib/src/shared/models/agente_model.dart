import 'package:flutter/material.dart';

class AgenteModel {
  String? id;
  final String type;
  final Icon icon;
  final String nomeEstacao;
  final String? nome;
  final bool ativo;
  final DateTime dataAgendamento;
  final DateTime dataRegistro;

  AgenteModel({
    this.id,
    required this.type,
    required this.icon,
    required this.nomeEstacao,
    this.nome,
    required this.ativo,
    required this.dataAgendamento,
    required this.dataRegistro,
  });
}
