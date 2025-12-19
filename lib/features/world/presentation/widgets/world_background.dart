import 'package:flutter/cupertino.dart';

class WorldBackground extends StatelessWidget {
  final Widget child;
  const WorldBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          Color(0xFFE9EDC9),
          Color(0xFFF6F5F3),
        ])
      ),
      child: child,
    );
  }
}
