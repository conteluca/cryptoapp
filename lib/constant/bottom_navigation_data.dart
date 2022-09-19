import 'package:flutter/material.dart';

class NavigationDestinationData {
  final Icon icon, selectedIcon;
  final String label;

  NavigationDestinationData(this.icon, this.selectedIcon, this.label);
}

final List<NavigationDestination> kBottomNavigationBar = [
  NavigationDestinationData(
    const Icon(Icons.home_outlined),
    const Icon(Icons.home),
    "Latest",
  ),
  NavigationDestinationData(
    const Icon(Icons.explore_outlined),
    const Icon(Icons.explore),
    "Discover",
  ),
  NavigationDestinationData(
    const Icon(Icons.account_circle_outlined),
    const Icon(Icons.account_circle),
    "Profile",
  ),
]
    .map((e) => NavigationDestination(
  icon: e.icon,
  label: e.label,
  selectedIcon: e.selectedIcon,
))
    .toList();