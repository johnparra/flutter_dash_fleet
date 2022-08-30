// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashfleet_app/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: AppRoutes.onGenerateSettings,
        routes: AppRoutes.getAppRoutes(),
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]),
      ),
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _paginaActual = 0;
  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    notifyListeners();
  }
}
