import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class BottomNavigationTransition extends StatelessWidget {
  final Widget child;

  const BottomNavigationTransition({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          FadeThroughTransition(
            fillColor: Colors.transparent,
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
      child: child,
    );
  }
}
