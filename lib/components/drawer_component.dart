import 'package:flutter/material.dart';

import 'drawer_item_component.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  final listViewPadding =
      const EdgeInsets.only(right: 16.0, top: 16.0, left: 8.0);
  final topSpace = const SizedBox(height: 8.0);
  final drawerItems = const [
    DrawerItem("Favourite", Icon(Icons.favorite)),
    DrawerItem("Deleted", Icon(Icons.delete)),
    DrawerItem("Label", Icon(Icons.label)),
  ];

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      child: ListView(
        padding: widget.listViewPadding,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {  },
                  child: Text('Sign in'),
                  // style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          widget.topSpace,
          ...widget.drawerItems
              .map((e) => DrawerItemComponent(
                    title: e.title,
                    icon: e.icon,
                    isSelected:
                        widget.drawerItems.indexOf(e) == _selectedDestination,
                    onTap: selectDestination,
                    index: widget.drawerItems.indexOf(e),
                  ))
              .toList()
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
