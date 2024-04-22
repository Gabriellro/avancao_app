import 'package:flutter/material.dart';

import 'package:animations/animations.dart';

const double fabSize = 56;

class CustomFABWidget extends StatelessWidget {
  final ContainerTransitionType transitionType;
  final Widget route;
  const CustomFABWidget({
    Key? key,
    required this.transitionType,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OpenContainer(
        transitionDuration: const Duration(milliseconds: 400),
        openBuilder: (context, _) => route,
        closedShape: const CircleBorder(),
        closedColor: Theme.of(context).colorScheme.primaryContainer,
        closedBuilder: (context, openContainer) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          height: fabSize,
          width: fabSize,
          child: Icon(
            Icons.add_rounded,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
}
