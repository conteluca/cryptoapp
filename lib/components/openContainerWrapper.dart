import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    Key? key,
    required this.transitionType,
    required this.closedBuilder,
    required this.onClosed,
    required this.child,
  }) : super(key: key);
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;
  final CloseContainerBuilder closedBuilder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return OpenContainer(
      openColor: backgroundColor,
      closedColor: backgroundColor,
      openElevation: 80,
      transitionDuration: const Duration(milliseconds: 300),
      transitionType: transitionType,
      onClosed: onClosed,
      tappable: true,
      closedBuilder: closedBuilder,
      openBuilder: (BuildContext context, VoidCallback _) => child,
    );
  }
}
