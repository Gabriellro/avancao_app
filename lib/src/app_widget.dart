import 'package:avancao_app/src/shared/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/providers/_export_providers.dart';

import 'shared/stores/app_store.dart';
import 'shared/theme/theme.dart';
import 'shared/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStore()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AppStore>(
        builder: (BuildContext context, value, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: value.themeMode,
            initialRoute: '/',
            routes: routes,
          );
        },
      ),
    );
  }
}
