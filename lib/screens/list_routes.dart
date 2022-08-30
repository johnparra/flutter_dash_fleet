import 'package:flutter/material.dart';
import 'package:dashfleet_app/widgets/widgets.dart' show CardContainer;

class ListRoutesScreen extends StatelessWidget {
  final routes = const ['Ruta 1', 'Ruta 2', 'Ruta 3', 'Ruta 4', 'Ruta 5'];
  final names = const ['Tabio', 'Zipaquira', 'Cajica', 'Chia', 'Bogota'];
  final distance = const ['30', '32', '22', '19', '5'];
  const ListRoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            padding: const EdgeInsets.only(top: 15),
            itemCount: routes.length,
            itemBuilder: (context, index) => CardContainer(
                  child: ListTile(
                      onTap: () {
                        final route = routes[index];
                        print(route);
                      },
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                      leading: const Icon(Icons.route_sharp),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            routes[index],
                          ),
                          Text(
                            names[index],
                          ),
                          Text(
                            '${distance[index]} Km',
                          ),
                        ],
                      )),
                ),
            separatorBuilder: (_, __) => const Divider()));
  }
}
