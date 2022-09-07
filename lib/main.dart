import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'applicationState.dart';
import 'constant/theme.dart';
import 'screen/home.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme(context).materialTheme,
      darkTheme: DarkTheme(context).materialTheme,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
