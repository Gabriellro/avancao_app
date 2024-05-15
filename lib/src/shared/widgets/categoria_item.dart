import 'package:flutter/material.dart';

import '../models/_export_models.dart';

class CategoriaItem extends StatelessWidget {
  final CategoriaModel categoriaModel;

  const CategoriaItem({
    Key? key,
    required this.categoriaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        categoriaModel.routePage,
        arguments: categoriaModel,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              categoriaModel.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              categoriaModel.nome,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}
