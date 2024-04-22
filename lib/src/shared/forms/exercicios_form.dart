import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/dummy_data.dart';

class ExerciciosForm extends StatefulWidget {
  const ExerciciosForm({Key? key}) : super(key: key);

  @override
  State<ExerciciosForm> createState() => _ExerciciosFormState();
}

class _ExerciciosFormState extends State<ExerciciosForm> {
  String? inputtedValue;
  String dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close_rounded),
        ),
        title: const Text('Novo exercício'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Salvar',
              ),
            ),
          )
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButtonFormField(
                value: dummyLoja.first,
                decoration: const InputDecoration(labelText: 'Colaborador'),
                icon: const Icon(Icons.arrow_drop_down_rounded),
                items: dummyLoja
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) =>
                    setState(() => inputtedValue = val as String),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: dataAtual,
                      decoration: const InputDecoration(
                        enabled: false,
                        labelText: "Exercício Inicial",
                        suffixIcon: Icon(Icons.today_rounded),
                      ),
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: dataAtual,
                      decoration: const InputDecoration(
                        enabled: false,
                        labelText: "Exercício Final",
                        suffixIcon: Icon(Icons.today_rounded),
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: dataAtual,
                decoration: const InputDecoration(
                  enabled: false,
                  labelText: "Data Limite",
                  suffixIcon: Icon(Icons.today_rounded),
                ),
                readOnly: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) => setState(() {
                      isChecked = value!;
                    }),
                  ),
                  Text(
                    'Datas para o ano seguinte',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
