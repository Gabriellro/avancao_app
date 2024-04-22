import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../shared/data/dummy_data.dart';
import '../../shared/forms/_export_forms.dart';
import '../../shared/widgets/_export_widgets.dart';

class ExerciciosPage extends StatefulWidget {
  static String routeName = "/ExerciciosPage";

  const ExerciciosPage({Key? key}) : super(key: key);

  @override
  State<ExerciciosPage> createState() => _ExerciciosPageState();
}

class _ExerciciosPageState extends State<ExerciciosPage> {
  final transitionType = ContainerTransitionType.fade;
  String? inputtedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Data de registro'),
                  SizedBox(width: 4),
                  Icon(Icons.sort_rounded)
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dummyExercicios.length,
              itemBuilder: (ctx, i) => Dismissible(
                key: ValueKey(dummyExercicios[i]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    dummyExercicios.removeAt(i);
                  });
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                child: ExerciciosListItem(
                  exerciciosModel: dummyExercicios[i],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFABWidget(
        transitionType: transitionType,
        route: const ExerciciosForm(),
      ),
    );
  }
}
