import 'package:cryptoapp/screen/discover.dart';
import 'package:cryptoapp/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/components/bottom_navigation_transition.dart';
import 'package:flutter/rendering.dart';
import '../backend/navigation_controller_state.dart';
import '../components/drawer_component.dart';
import '../components/scroll_to_hide_widget.dart';
import 'latest.dart';

class Home extends StatefulWidget {
  static const String id = "HOME";

  final List<NavigationDestination> kBottomNavigationBar = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: "Latest",
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.explore_outlined),
      label: "Discover",
      selectedIcon: Icon(Icons.explore),
    ),
    NavigationDestination(
      icon: Icon(Icons.account_circle_outlined),
      label: "Profile",
      selectedIcon: Icon(Icons.account_circle),
    ),
  ];

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late NavigationControllerState _controllerLatest,
      _controllerDiscover,
      _controllerProfile;
  late final List<NavigationControllerState> _controllers = [];
  late List<Widget> _screens;
  int _bottomNavigationIndex = 1;
  bool _showFloatingActionButton = false;

  @override
  void initState() {
    _buildControllers();
    _buildScreens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: ScrollToHideWidget(
        isVisible: _controllers[_bottomNavigationIndex].isVisible,
        child: NavigationBar(
          elevation: 80,
          animationDuration: kThemeAnimationDuration,
          selectedIndex: _bottomNavigationIndex,
          onDestinationSelected: _onDestinationSelected,
          destinations: widget.kBottomNavigationBar,
        ),
      ),
      body: BottomNavigationTransition(
        child: _screens[_bottomNavigationIndex],
      ),
    );
  }

  _buildFloatingActionButton() {
    return _bottomNavigationIndex == 0 && _showFloatingActionButton
        ? FloatingActionButton(
            onPressed: _goToTop, child: const Icon(Icons.arrow_upward_rounded))
        : null;
  }
  _goToTop() {
    _controllerLatest.controller.animateTo(0.0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }
  _onDestinationSelected(int value) {
    setState(() {
      _bottomNavigationIndex = value;
    });
  }
  _enableFloatingActionButton() {
    if (_controllerLatest.controller.position.pixels > 100.0) {
      setState(() {
        _showFloatingActionButton = true;
      });
    } else {
      setState(() {
        _showFloatingActionButton = false;
      });
    }
  }
  _buildScreens() {
    _screens = [
      Latest(controller: _controllerLatest.controller),
      Discover(controller: _controllerDiscover.controller),
      Profile(controller: _controllerProfile.controller),
    ];
  }
  void _buildControllers() {
    _controllerLatest = NavigationControllerState();
    _controllerDiscover = NavigationControllerState();
    _controllerProfile = NavigationControllerState();
    _attachListener(_controllerLatest);
    _attachListener(_controllerDiscover);
    _attachListener(_controllerProfile);
    _controllers
        .addAll([_controllerLatest, _controllerDiscover, _controllerProfile]);
    _controllerLatest.controller.addListener(_enableFloatingActionButton);
  }


  @override
  void dispose() {
    _controllers.map((e) {
      e.dispose();
    });
    super.dispose();
  }

  void _attachListener(NavigationControllerState navigationController) {
    navigationController.controller.addListener(() {
      var direction =
          navigationController.controller.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        setState(() {
          navigationController.show();
        });
      } else {
        setState(() {
          navigationController.hide();
        });
      }
    });
  }
}
