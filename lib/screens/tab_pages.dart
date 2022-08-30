import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashfleet_app/router/app_routes.dart';
import 'package:dashfleet_app/screens/screens.dart';

class TabPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100.0,
            titleTextStyle: const TextStyle(fontSize: 30),
            backgroundColor: Colors.green,
            title: Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.person_outline_rounded),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Lorem Name',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Lorem Name',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            )),
        endDrawer: const DrawerMenu(),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Rutas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_sharp), label: 'Alertas'),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeScreen(),
        ListRoutesScreen(),
        AlertScreen(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
