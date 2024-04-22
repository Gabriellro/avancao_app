import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '_export_widgets.dart';

class BottomSheetAgendar extends StatefulWidget {
  const BottomSheetAgendar({super.key});

  @override
  State<BottomSheetAgendar> createState() => _BottomSheetAgendarState();
}

class _BottomSheetAgendarState extends State<BottomSheetAgendar> {
  bool repetirAagendamento = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Tudo certo com o agendamento?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  child: EstacaoTrabalhoItem(
                    estacaoTrabalhoModel: dummyEstacoesTrabalhoComuns[1],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  child: EstacaoTrabalhoItem(
                    estacaoTrabalhoModel: dummyEstacoesTrabalhoComuns[1],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Repetir agendamento'),
                    value: repetirAagendamento,
                    onChanged: (bool value) {
                      setState(() {
                        repetirAagendamento = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 4),
                Visibility(
                  visible: repetirAagendamento,
                  child: DropdownButtonFormField(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    decoration: const InputDecoration(
                      label: Text('Periodo'),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Selecione o Periodo',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['Apple', 'Mango', 'Banana', 'Peach']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 48,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text("Confirmar"),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 48,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Alterar"),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
