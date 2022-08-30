import 'package:flutter/material.dart';

class MenuOptions {
  final String name;
  final String route;
  final IconData icon;
  final Widget screen;
  final bool show;

  MenuOptions(
      {required this.name,
      required this.route,
      required this.icon,
      required this.screen,
      required this.show});
}
