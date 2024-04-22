import 'package:avancao_app/src/modules/ferias/ferias_page.dart';
import 'package:flutter/material.dart';

import '../../modules/_export_modules.dart';

final Map<String, WidgetBuilder> routes = {
  IsAuthPage.routeName: (_) => const IsAuthPage(),
  AuthPage.routeName: (_) => const AuthPage(),
  BottomNavBar.routeName: (_) => const BottomNavBar(),
  CoworkingPage.routeName: (_) => const CoworkingPage(),
  MenuPage.routeName: (_) => const MenuPage(),
  FeriasPage.routeName: (_) => const FeriasPage(),
  ExerciciosPage.routeName: (_) => const ExerciciosPage(),
  UserPage.routeName: (_) => const UserPage(),
};
