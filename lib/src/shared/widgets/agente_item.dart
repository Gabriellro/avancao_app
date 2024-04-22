import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';

import '../models/_export_models.dart';

class AgenteItem extends StatefulWidget {
  final AgenteModel agenteModel;
  const AgenteItem({
    Key? key,
    required this.agenteModel,
  }) : super(key: key);

  @override
  State<AgenteItem> createState() => _AgenteItemState();
}

class _AgenteItemState extends State<AgenteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          hasIcon: false,
        ),
        header: ListTile(
          minLeadingWidth: 40,
          leading: Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: widget.agenteModel.icon,
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.agenteModel.nomeEstacao} - ${widget.agenteModel.id}',
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.person_rounded,
                size: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 4),
              Text(widget.agenteModel.nome ?? ''),
              const Text(' - '),
              Text(
                DateFormat('dd/MM/yyyy').format(
                  widget.agenteModel.dataAgendamento,
                ),
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
                    text: 'Status: ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.agenteModel.ativo
                            ? 'Reservado'
                            : 'Cancelado',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    text: 'Data Agendada: ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy').format(
                          widget.agenteModel.dataAgendamento,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    text: 'Data de Registro: ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat('dd/MM/yyyy').format(
                          widget.agenteModel.dataRegistro,
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
