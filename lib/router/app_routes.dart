import 'package:flutter/material.dart';

import 'package:dashfleet_app/models/models.dart';
import 'package:dashfleet_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static final menuOptions = <MenuOptions>[
    //TODO Borrar home
    MenuOptions(
        show: true,
        name: 'Lista de Rutas',
        route: 'list_routes',
        screen: const ListRoutesScreen(),
        icon: Icons.list_alt_sharp),
    MenuOptions(
        show: true,
        name: 'Alertas',
        route: 'alert',
        screen: const AlertScreen(),
        icon: Icons.taxi_alert),
    MenuOptions(
        show: false,
        name: 'Login Screen',
        route: 'login',
        screen: const LoginScreen(),
        icon: Icons.login),
    MenuOptions(
        show: false,
        name: 'Home',
        route: 'home',
        screen: const HomeScreen(),
        icon: Icons.home),
    MenuOptions(
        show: false,
        name: 'Tabs',
        route: 'tabs',
        screen: TabPages(),
        icon: Icons.home),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'list_routes': (BuildContext context) => const ListRoutesScreen(),
  };

  static Route<dynamic> onGenerateSettings(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
