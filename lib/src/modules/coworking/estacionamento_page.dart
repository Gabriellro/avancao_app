import 'package:flutter/material.dart';

import '../../shared/data/dummy_data.dart';
import '../../shared/widgets/_export_widgets.dart';

class EstacionamentoPage extends StatefulWidget {
  const EstacionamentoPage({Key? key}) : super(key: key);

  @override
  State<EstacionamentoPage> createState() => _EstacionamentoPageState();
}

class _EstacionamentoPageState extends State<EstacionamentoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      'Vagas disponíveis (5)',
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
                itemCount: dummyEstacionamento.length,
                itemBuilder: (ctx, i) => SalaReuniaoItem(
                  salaReuniaoModel: dummyEstacionamento[i],
                ),
              ),
              const SizedBox(height: 80)
            ],
          ),
        ],
      ),
    );
  }
}
