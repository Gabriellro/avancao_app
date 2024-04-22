import 'package:flutter/material.dart';

import '../../shared/data/dummy_data.dart';
import '../../shared/widgets/_export_widgets.dart';

enum FilterOpitions {
  todas,
  dadosSensiveis,
  comuns,
  notebook,
  pcLinux,
  pcWindows
}

class EstacoesTrabalhoPage extends StatefulWidget {
  const EstacoesTrabalhoPage({Key? key}) : super(key: key);

  @override
  State<EstacoesTrabalhoPage> createState() => _EstacoesTrabalhoPageState();
}

class _EstacoesTrabalhoPageState extends State<EstacoesTrabalhoPage> {
  FilterOpitions? _option = FilterOpitions.todas;

  void _selectSort(FilterOpitions? value) {
    setState(() {
      _option = value;
    });
  }

  void _bottomSheetAgendar(context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return const BottomSheetAgendar();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Estações disponíveis (19)',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => const AlertDialog(
                            title: Text('Filtrar por'),
                            contentPadding: EdgeInsets.all(0),
                            content: RadioExample(),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Text('Todas'),
                              SizedBox(width: 8),
                              Icon(Icons.filter_list_rounded),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        'Dados Sensíveis',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dummyEstacoesTrabalhoDS.length,
                  itemBuilder: (ctx, i) => RadioListTile<FilterOpitions>(
                    contentPadding: const EdgeInsets.only(right: 8),
                    value: FilterOpitions.pcLinux,
                    groupValue: _option,
                    onChanged: _selectSort,
                    title: EstacaoTrabalhoItem(
                      estacaoTrabalhoModel: dummyEstacoesTrabalhoDS[i],
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        'Comuns',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dummyEstacoesTrabalhoComuns.length,
                  itemBuilder: (ctx, i) => RadioListTile<FilterOpitions>(
                    contentPadding: const EdgeInsets.only(right: 8),
                    value: FilterOpitions.pcWindows,
                    groupValue: _option,
                    onChanged: _selectSort,
                    title: EstacaoTrabalhoItem(
                      estacaoTrabalhoModel: dummyEstacoesTrabalhoComuns[i],
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Visibility(
        visible: _option == FilterOpitions.pcWindows ||
            _option == FilterOpitions.pcLinux,
        child: FloatingActionButton.extended(
          label: const Text("Agendar"),
          elevation: 0,
          icon: const Icon(Icons.add_rounded),
          onPressed: () => _bottomSheetAgendar(context),
          // onPressed: () => showModalBottomSheet(
          //   showDragHandle: true,
          //   isDismissible: true,
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) {
          //     return Wrap(
          //       children: [
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           mainAxisSize: MainAxisSize.max,
          //           children: [
          //             Text(
          //               'Tudo certo com o agendamento?',
          //               textAlign: TextAlign.center,
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .titleMedium
          //                   ?.copyWith(
          //                       color: Theme.of(context).colorScheme.onSurface),
          //             ),
          //             const SizedBox(height: 24),
          //             Column(
          //               children: [
          //                 Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 8),
          //                   width: double.infinity,
          //                   child: EstacaoTrabalhoItem(
          //                     estacaoTrabalhoModel:
          //                         dummyEstacoesTrabalhoComuns[1],
          //                   ),
          //                 ),
          //                 const SizedBox(height: 16),
          //                 Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 8),
          //                   width: double.infinity,
          //                   child: EstacaoTrabalhoItem(
          //                     estacaoTrabalhoModel:
          //                         dummyEstacoesTrabalhoComuns[1],
          //                   ),
          //                 ),
          //                 const SizedBox(height: 16),
          //                 Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 24),
          //                   child: SwitchListTile(
          //                     contentPadding: EdgeInsets.zero,
          //                     title: const Text('Repetir agendamento'),
          //                     value: repetirAagendamento,
          //                     onChanged: (bool value) {
          //                       setState(() {
          //                         repetirAagendamento = value;
          //                       });
          //                     },
          //                   ),
          //                 ),
          //                 const SizedBox(height: 4),
          //                 Visibility(
          //                   visible: repetirAagendamento,
          //                   child: DropdownButtonFormField(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 24),
          //                     icon:
          //                         const Icon(Icons.keyboard_arrow_down_rounded),
          //                     decoration: const InputDecoration(
          //                       label: Text('Periodo'),
          //                       floatingLabelBehavior:
          //                           FloatingLabelBehavior.always,
          //                       hintText: 'Selecione o Periodo',
          //                       border: OutlineInputBorder(),
          //                     ),
          //                     items: <String>[
          //                       'Apple',
          //                       'Mango',
          //                       'Banana',
          //                       'Peach'
          //                     ].map<DropdownMenuItem<String>>((String value) {
          //                       return DropdownMenuItem<String>(
          //                         value: value,
          //                         child: Text(
          //                           value,
          //                         ),
          //                       );
          //                     }).toList(),
          //                     onChanged: (value) {},
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const SizedBox(height: 24),
          //             Column(
          //               children: [
          //                 Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 24),
          //                   height: 48,
          //                   width: double.infinity,
          //                   child: FilledButton(
          //                     onPressed: () {},
          //                     child: const Text("Confirmar"),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 8),
          //                 Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 24),
          //                   height: 48,
          //                   width: double.infinity,
          //                   child: TextButton(
          //                     onPressed: () => Navigator.pop(context),
          //                     child: const Text("Alterar"),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 24),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
