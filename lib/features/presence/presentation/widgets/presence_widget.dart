import 'package:flutter/material.dart';

class PresenceWidget extends StatefulWidget {
  const PresenceWidget({super.key});

  @override
  State<PresenceWidget> createState() => _PresenceWidgetState();
}

class _PresenceWidgetState extends State<PresenceWidget>
    with TickerProviderStateMixin {
  late AnimationController floatController;
  late AnimationController breatheController;
  late AnimationController glowController;


  @override
  void initState() {
    super.initState();

    floatController = AnimationController(vsync: this,
    duration: Duration(seconds: 10)
    )..repeat(reverse: true);

    breatheController = AnimationController(vsync: this,
        duration: Duration(seconds: 6)
    )..repeat(reverse: true);

    glowController = AnimationController(vsync: this,
        duration: Duration(seconds: 8)
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    floatController.dispose();
    breatheController.dispose();
    glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        floatController,
        breatheController,
        glowController
      ]),
      builder: (_, __) {
        final floatY = -8 + (floatController.value * 16);
        final scale = 0.95 + (breatheController.value * 0.08);
        final glow = 0.4 + (glowController.value * 0.3);


        return Transform.translate(
          offset: Offset(
            -4 + (floatController.value * 8),
            floatY,
          ),
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFCBC0D3).withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFCBC0D3).withOpacity(0.5),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          )
        );
      },
    );
  }
}


///   final energy = ref.watch(worldControllerProvider).energy.total;
///   final glowBoost = (energy / 500).clamp(0.0, 0.3);