import 'package:flutter/material.dart';

import '../../shared/data/dummy_data.dart';
import '../../shared/widgets/_export_widgets.dart';

class SalasReunioesPage extends StatefulWidget {
  const SalasReunioesPage({Key? key}) : super(key: key);

  @override
  State<SalasReunioesPage> createState() => _SalasReunioesPageState();
}

class _SalasReunioesPageState extends State<SalasReunioesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 48,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Salas disponíveis (2)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Ordenar por'),
                      content: RadioExample(),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: dummySalaReuniao.length,
            itemBuilder: (ctx, i) => SalaReuniaoItem(
              salaReuniaoModel: dummySalaReuniao[i],
            ),
          ),
          const SizedBox(height: 80)
        ],
      ),
    );
  }
}
