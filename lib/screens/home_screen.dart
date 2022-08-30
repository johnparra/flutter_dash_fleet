import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashfleet_app/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final optionsToShow = AppRoutes.menuOptions;
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (BuildContext context, index) {
              final widgetResult = (optionsToShow[index].show)
                  ? ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, optionsToShow[index].route);
                      },
                      trailing: Icon(optionsToShow[index].icon),
                      title: Text(optionsToShow[index].name))
                  : const SizedBox();
              return widgetResult;
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: optionsToShow.length));
  }
}
