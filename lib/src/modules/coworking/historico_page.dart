import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/data/dummy_data.dart';
import '../../shared/widgets/_export_widgets.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                      title: Text('Ordenar por'),
                      contentPadding: EdgeInsets.all(0),
                      content: RadioExample(),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Apenas eu'),
                        SizedBox(width: 8),
                        Icon(Icons.sort_rounded),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  DateFormat("EEE., dd 'd'e MMM").format(start),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dummyAgentes.length,
            itemBuilder: (ctx, i) => AgenteItem(
              agenteModel: dummyAgentes[i],
            ),
          ),
          const SizedBox(height: 80)
        ],
      ),
    );
  }
}
