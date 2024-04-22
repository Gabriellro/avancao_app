import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import 'package:intl/intl.dart';

import '../models/_export_models.dart';

class ExerciciosListItem extends StatefulWidget {
  final ExerciciosModel exerciciosModel;
  const ExerciciosListItem({
    Key? key,
    required this.exerciciosModel,
  }) : super(key: key);

  @override
  State<ExerciciosListItem> createState() => _ExerciciosListItemState();
}

class _ExerciciosListItemState extends State<ExerciciosListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inverseSurface,
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          hasIcon: false,
        ),
        header: ListTile(
          minLeadingWidth: 40,
          leading:  Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                child: Text(
                  '${widget.exerciciosModel.supervisor[0]}${widget.exerciciosModel.supervisor[5]}',
                ),
              ),
            ],
          ),
          title: Text(
            widget.exerciciosModel.colaborador,
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.supervisor_account_rounded,
                size: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 4),
              Text(
                widget.exerciciosModel.supervisor,
              ),
              const Text(' - '),
              Text(
                DateFormat("dd 'de' MMM.")
                    .format(widget.exerciciosModel.dataRegistro),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
        collapsed: const SizedBox.shrink(),
        expanded: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 72),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                RichText(
                  text: TextSpan(
                    text: 'Exercício Inicial: ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy').format(
                          widget.exerciciosModel.exercicioInicial,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    text: 'Exercício Final: ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy').format(
                          widget.exerciciosModel.exercicioFinal,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    text: 'Data Limite: ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy').format(
                          widget.exerciciosModel.dataLimite,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
