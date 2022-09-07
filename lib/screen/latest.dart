import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../constant/color_schemes.g.dart';

class Latest extends StatefulWidget {
  const Latest({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;
  final titleStyle = const TextStyle(fontWeight: FontWeight.bold);
  final searchIcon = const Icon(Icons.search);
  final menuIcon = const Icon(Icons.menu);
  final notificationIcon = const Icon(Icons.notifications);
  final stretchModes = const [
    StretchMode.zoomBackground,
    StretchMode.blurBackground,
    StretchMode.fadeTitle
  ];

  @override
  State<Latest> createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  bool _showBalance = true;
  final double _balance = 12368.89;

  _changeShowBalance() {
    setState(() {
      _showBalance = !_showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: widget.controller,
      slivers: [
        SliverAppBar(
          title: Text("Wallet",style: widget.titleStyle,),
          expandedHeight: 350.0,
          actions: actions(),
          stretch: true,
          stretchTriggerOffset: 150.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            stretchModes: widget.stretchModes,
            background: Container(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primaryContainer,
              child: Center(
                child: InkWell(
                  onTap: _changeShowBalance,
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        brightness == Brightness.dark ? Lottie.asset('assets/anim.json'):Lottie.asset('assets/anim_light.json'),
                        Center(
                          child: Text(
                            _showBalance?"$_balance\$":"* * * * *",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 36),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                  ListTile(
                    leading: Text(
                      index.toString(),
                      textScaleFactor: 2,
                    ),
                  ),
            ))
      ],
    );
  }

  List<Widget> actions() {
    return [
      IconButton(icon: widget.searchIcon, onPressed: () => {}),
      IconButton(icon: widget.notificationIcon, onPressed: () => {}),
      const SizedBox(width: 8.0,)
    ];
  }
}
