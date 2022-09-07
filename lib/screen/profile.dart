import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
          // title: const Text("Profile"),
          expandedHeight: 250.0,
          stretch: true,
          stretchTriggerOffset: 150.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle
            ],
            title: CircleAvatar(
              backgroundImage: NetworkImage('https://images.pexels.com/photos/1055691/pexels-photo-1055691.jpeg?cs=srgb&dl=pexels-evg-kowalievska-1055691.jpg&fm=jpg'),
            ),
            centerTitle: true,
            expandedTitleScale: 5.0,
            background: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => ListTile(
                  title: Text("Data $index"),
                ))),
      ],
    );
  }
}
