import 'package:flutter/material.dart';


const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  surfaceTint: Color(0xFF6750A4),
  onErrorContainer: Color(0xFF410E0B),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onTertiaryContainer: Color(0xFF31111D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  tertiary: Color(0xFF7D5260),
  shadow: Color(0xFF000000),
  error: Color(0xFFB3261E),
  outline: Color(0xFF79747E),
  onBackground: Color(0xFF1C1B1F),
  background: Color(0xFFFFFBFE),
  onInverseSurface: Color(0xFFF4EFF4),
  inverseSurface: Color(0xFF313033),
  onSurfaceVariant: Color(0xFF49454F),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  surface: Color(0xFFFFFBFE),
  onSecondaryContainer: Color(0xFF1D192B),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  secondary: Color(0xFF625B71),
  inversePrimary: Color(0xFFD0BCFF),
  onPrimaryContainer: Color(0xFF21005D),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  primary: Color(0xFF6750A4),
);
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFBDC2FF),
  onPrimary: Color(0xFF0D1C92),
  primaryContainer: Color(0xFF2C39A8),
  onPrimaryContainer: Color(0xFFDFE0FF),
  secondary: Color(0xFFC4C5DD),
  onSecondary: Color(0xFF2D2F42),
  secondaryContainer: Color(0xFF444559),
  onSecondaryContainer: Color(0xFFE0E0F9),
  tertiary: Color(0xFFE7B9D6),
  onTertiary: Color(0xFF45263C),
  tertiaryContainer: Color(0xFF5E3C53),
  onTertiaryContainer: Color(0xFFFFD7EF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE4E1E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE4E1E6),
  surfaceVariant: Color(0xFF46464F),
  onSurfaceVariant: Color(0xFFC7C5D0),
  outline: Color(0xFF91909A),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE4E1E6),
  inversePrimary: Color(0xFF4653C1),
  shadow: Color(0xFF000000),
);

const kPageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
  },
);
const double kIconSize = 22.0;