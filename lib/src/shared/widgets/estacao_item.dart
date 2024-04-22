import 'package:flutter/material.dart';

import '../models/_export_models.dart';

class EstacaoItem extends StatefulWidget {
  final EstacaoTrabalhoModel estacaoTrabalhoModel;
  const EstacaoItem({
    super.key,
    required this.estacaoTrabalhoModel,
  });

  @override
  State<EstacaoItem> createState() => _EstacaoItemState();
}

class _EstacaoItemState extends State<EstacaoItem> {
  bool? selectEstacao = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.estacaoTrabalhoModel.nome == null
          ? () => setState(
                () {
                  selectEstacao = !selectEstacao!;
                  // Navigator.pushNamed(
                  //   context,
                  //   BottomNavBar.routeName,
                  //   arguments: selectEstacao,
                  // );
                },
              )
          : null,
      child: Opacity(
        opacity: widget.estacaoTrabalhoModel.nome == null ? 1.0 : 0.38,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  width: selectEstacao! ? 4 : 0,
                  color: selectEstacao!
                      ? Theme.of(context).colorScheme.tertiaryContainer
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: widget.estacaoTrabalhoModel.icon,
            ),
            const SizedBox(height: 4),
            Text(
              widget.estacaoTrabalhoModel.nome ?? 'Disponivel',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.estacaoTrabalhoModel.nomeEstacao} – ${widget.estacaoTrabalhoModel.id}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
