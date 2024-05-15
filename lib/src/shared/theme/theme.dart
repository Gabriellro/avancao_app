import 'package:flutter/material.dart';
part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    appBarTheme: const AppBarTheme(titleSpacing: 0),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(
        _lightColorScheme.primary,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
        ),
      ),
    ));

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: const AppBarTheme(titleSpacing: 0),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(
          _darkColorScheme.primary,
        ),
      ),
    );
// import 'color_schemes.g.dart';
// import 'text_theme.g.dart';

// export 'app_colors.dart';
// export 'app_images.dart';
// export 'app_svg.dart';
// export 'app_text_styles.dart';

/// Reference to the application theme.
// abstract class AppTheme {
//   AppTheme._();

//   /// Light theme and its settings.
//   static ThemeData light() {
//     return ThemeData(
//       useMaterial3: true,
//       textTheme: lightTextTheme,
//       colorScheme: lightColorScheme,
//       appBarTheme: const AppBarTheme(titleSpacing: 0),
//     );
//   }

//   /// Dark theme and its settings.
//   static ThemeData dark() {
//     return ThemeData(
//       textTheme: lightTextTheme,
//       colorScheme: darkColorScheme,
//       appBarTheme: const AppBarTheme(titleSpacing: 0),
//     );
//   }
// }
