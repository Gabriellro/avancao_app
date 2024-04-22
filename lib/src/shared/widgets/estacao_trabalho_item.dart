import 'package:flutter/material.dart';

import '../models/_export_models.dart';

class EstacaoTrabalhoItem extends StatefulWidget {
  final EstacaoTrabalhoModel estacaoTrabalhoModel;
  const EstacaoTrabalhoItem({
    Key? key,
    required this.estacaoTrabalhoModel,
  }) : super(key: key);

  @override
  State<EstacaoTrabalhoItem> createState() => _EstacaoTrabalhoItemState();
}

class _EstacaoTrabalhoItemState extends State<EstacaoTrabalhoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: widget.estacaoTrabalhoModel.icon,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${widget.estacaoTrabalhoModel.nomeEstacao}-${widget.estacaoTrabalhoModel.id}',
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.estacaoTrabalhoModel.ativo
                        ? 'Disponivel'
                        : 'Reservado',
                    style: widget.estacaoTrabalhoModel.ativo
                        ? Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0XFF4CAF50))
                        : Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xFFFD6822)),
                  ),
                  widget.estacaoTrabalhoModel.ativo
                      ? const SizedBox.shrink()
                      : Row(
                          children: [
                            const Text(' – '),
                            Text(
                              widget.estacaoTrabalhoModel.nome ?? '',
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
