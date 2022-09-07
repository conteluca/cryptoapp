import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.g.dart';

abstract class CustomTheme {
  final BuildContext context;

  const CustomTheme(this.context);

  ThemeData get materialTheme;
}

class LightTheme extends CustomTheme {
  const LightTheme(context) : super(context);

  @override
  ThemeData get materialTheme {
    return ThemeData.light().copyWith(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      pageTransitionsTheme: kPageTransitionsTheme,
      scaffoldBackgroundColor: lightColorScheme.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            highlightColor: lightColorScheme.onPrimaryContainer,
          ),
    );
  }
}

class DarkTheme extends CustomTheme {
  const DarkTheme(context) : super(context);

  @override
  ThemeData get materialTheme {
    return ThemeData.dark().copyWith(
      colorScheme: darkColorScheme,
      useMaterial3: true,
      pageTransitionsTheme: kPageTransitionsTheme,
      scaffoldBackgroundColor: darkColorScheme.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            highlightColor: darkColorScheme.onPrimaryContainer,
          ),
    );
  }
}
