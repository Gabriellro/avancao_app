import 'package:avancao_app/src/shared/models/sala_reuniao_model.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import '../models/_export_models.dart';

enum HoursMatutinoFilter { oito, nove, dez, onze, doze }

enum HoursVespertinoFilter { uma, duas, tres, quarto, cinco }

extension HoursMatutinoFilterExtension on HoursMatutinoFilter {
  String get number {
    switch (this) {
      case HoursMatutinoFilter.oito:
        return '08:00';
      case HoursMatutinoFilter.nove:
        return '09:00';
      case HoursMatutinoFilter.dez:
        return '10:00';
      case HoursMatutinoFilter.onze:
        return '11:00';
      case HoursMatutinoFilter.doze:
        return '12:00';
    }
  }
}

extension HoursVespertinoFilterExtension on HoursVespertinoFilter {
  String get number {
    switch (this) {
      case HoursVespertinoFilter.uma:
        return '13:00';
      case HoursVespertinoFilter.duas:
        return '14:00';
      case HoursVespertinoFilter.tres:
        return '15:00';
      case HoursVespertinoFilter.quarto:
        return '16:00';
      case HoursVespertinoFilter.cinco:
        return '17:00';
    }
  }
}

class SalaReuniaoItem extends StatefulWidget {
  final SalaReuniaoModel salaReuniaoModel;
  const SalaReuniaoItem({
    Key? key,
    required this.salaReuniaoModel,
  }) : super(key: key);

  @override
  State<SalaReuniaoItem> createState() => _SalaReuniaoItemState();
}

class _SalaReuniaoItemState extends State<SalaReuniaoItem> {
  Set<HoursMatutinoFilter> matutinoFilters = <HoursMatutinoFilter>{};
  Set<HoursVespertinoFilter> vespertinoFilters = <HoursVespertinoFilter>{};
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          useInkWell: true,
          hasIcon: true,
          iconPadding: const EdgeInsets.only(top: 28, right: 16),
          iconColor: Theme.of(context).colorScheme.onSurface,
        ),
        header: SizedBox(
          height: 58,
          child: ListTile(
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
                    child: Icon(
                      widget.salaReuniaoModel.icon,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
            title: Text(
              '${widget.salaReuniaoModel.nomeSala} – ${widget.salaReuniaoModel.id}',
            ),
            subtitle: Text(
              '15 Pessoas',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ),
        ),
        collapsed: const SizedBox.shrink(),
        expanded: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Matutino', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 5.0,
                  children: HoursMatutinoFilter.values
                      .map((HoursMatutinoFilter hours) {
                    return FilterChip(
                      label: Text(hours.number),
                      selected: matutinoFilters.contains(hours),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            matutinoFilters.add(hours);
                          } else {
                            matutinoFilters.remove(hours);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Text('Vespertino',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 5.0,
                  children: HoursVespertinoFilter.values
                      .map((HoursVespertinoFilter hours) {
                    return FilterChip(
                      label: Text(hours.number),
                      selected: vespertinoFilters.contains(hours),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            vespertinoFilters.add(hours);
                          } else {
                            vespertinoFilters.remove(hours);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
