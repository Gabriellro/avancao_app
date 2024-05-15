import 'package:flutter/material.dart';

class SalaReuniaoModel {
  String? id;
  final String type;
  final IconData icon;
  final String nomeSala;
  final String? nome;
  final bool ativo;
  final DateTime dataAgendamento;
  final DateTime dataRegistro;

  SalaReuniaoModel({
    this.id,
    required this.type,
    required this.icon,
    required this.nomeSala,
    this.nome,
    required this.ativo,
    required this.dataAgendamento,
    required this.dataRegistro,
  });
}
