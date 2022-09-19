import 'package:flutter/material.dart';

class DrawerItemComponent extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool isSelected;
  final int index;
  final Function(int) onTap;
  final Radius radius = const Radius.circular(32.0);

  const DrawerItemComponent(
      {Key? key,
        required this.title,
        required this.icon,
        required this.index,
        required this.isSelected,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        textScaleFactor: isSelected ? 1.1 : 1,
        style: TextStyle(
            fontWeight: isSelected
                ? FontWeight.bold
                : Theme.of(context).textTheme.displaySmall!.fontWeight),
      ),
      selected: isSelected,
      onTap: () => onTap(index),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      ),
      selectedTileColor: Theme.of(context).colorScheme.secondary,
      selectedColor: Theme.of(context).colorScheme.onSecondary,
    );
  }
}

class DrawerItem {
  final String title;
  final Icon icon;

  const DrawerItem(this.title, this.icon);
}
