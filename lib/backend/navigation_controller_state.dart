import 'package:flutter/material.dart';

class NavigationControllerState {
  final ScrollController controller = ScrollController();
  bool isVisible = true;
  NavigationControllerState();

  void show() {
    if (!isVisible) {
      isVisible = true;
    }
  }

  void hide() {
    if (isVisible) {
      isVisible = false;
    }
  }

  void dispose() {
    controller.dispose();
  }
}
