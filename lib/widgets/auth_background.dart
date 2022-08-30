import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [_GreenBox(), _HeaderTitle(), child],
        ));
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 200,
        child: Column(children: [
          _IconBus(),
          const Text('AMB APP',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ]),
      ),
    );
  }
}

class _IconBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 100,
        child: const Icon(Icons.directions_bus_sharp,
            color: Colors.white, size: 60),
      ),
    );
  }
}

class _GreenBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: _greenGradient(),
    );
  }

  BoxDecoration _greenGradient() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(12, 240, 42, 1),
        Color.fromRGBO(235, 155, 73, 1)
      ]));
}
