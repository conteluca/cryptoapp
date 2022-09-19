import 'package:flutter/material.dart';

class ScrollToHideWidget extends StatelessWidget {
  const ScrollToHideWidget({
    Key? key,
    required this.child,
    required this.isVisible,
    this.duration = const Duration(milliseconds: 400),
  }) : super(key: key);
  final Duration duration;
  final Widget child;
  final bool isVisible;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: duration,
        height: isVisible ? 80.0 : 0,
        child: Wrap(
          children: [child],
        ),
      );
}
