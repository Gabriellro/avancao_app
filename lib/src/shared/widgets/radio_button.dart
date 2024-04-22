import 'package:flutter/material.dart';

enum FilterOpitions {
  todas,
  dadosSensiveis,
  comuns,
  notebook,
  pcLinux,
  pcWindows
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  FilterOpitions? _option = FilterOpitions.todas;

  void _selectSort(FilterOpitions? value) {
    setState(() {
      _option = value;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RadioListTile<FilterOpitions>(
          value: FilterOpitions.todas,
          groupValue: _option,
          onChanged: _selectSort,
          title: const Text('Todas'),
        ),
        RadioListTile<FilterOpitions>(
          value: FilterOpitions.dadosSensiveis,
          groupValue: _option,
          onChanged: _selectSort,
          title: const Text('Dados Sensíveis'),
        ),
        RadioListTile<FilterOpitions>(
          value: FilterOpitions.comuns,
          groupValue: _option,
          onChanged: _selectSort,
          title: const Text('Comuns'),
        ),
        RadioListTile<FilterOpitions>(
          value: FilterOpitions.notebook,
          groupValue: _option,
          onChanged: _selectSort,
          title: const Text('Estação para Notebook'),
        ),
        RadioListTile<FilterOpitions>(
          value: FilterOpitions.pcLinux,
          groupValue: _option,
          onChanged: _selectSort,
          title: const Text('Estação com PC Linux'),
        ),
        RadioListTile<FilterOpitions>(
          value: FilterOpitions.pcWindows,
          groupValue: _option,
          onChanged: _selectSort,
          title: const Text('Estação com PC Windows'),
        ),
      ],
    );
  }
}

// Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       RadioListTile<ThemeMode>(
//                         enableFeedback: true,
//                         value: ThemeMode.system,
//                         groupValue: _character,
//                         title: const Text('System'),
//                         onChanged: (ThemeMode? value) {
//                           appStore.switchTheme(value);
//                         },
//                       ),
//                       RadioListTile<ThemeMode>(
//                         value: ThemeMode.light,
//                         groupValue: _character,
//                         title: const Text('Light'),
//                         onChanged: appStore.switchTheme,
//                       ),
//                       RadioListTile<ThemeMode>(
//                         value: ThemeMode.dark,
//                         groupValue: _character,
//                         title: const Text('Dark'),
//                         onChanged: appStore.switchTheme,
//                       ),
//                     ],
//                   ),