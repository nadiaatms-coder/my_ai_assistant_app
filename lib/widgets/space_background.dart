import 'dart:math';
import 'package:flutter/material.dart';

class SpaceBackground extends StatefulWidget {
  final Widget child;

  const SpaceBackground({super.key, required this.child});

  @override
  State<SpaceBackground> createState() => _SpaceBackgroundState();
}

class _SpaceBackgroundState extends State<SpaceBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF050816),
                Color(0xFF0B1026),
                Color(0xFF000000),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: Size.infinite,
              painter: GalaxyPainter(_controller.value),
            );
          },
        ),

        Positioned.fill(child: widget.child),
      ],
    );
  }
}

class GalaxyPainter extends CustomPainter {
  final double progress;

  GalaxyPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42);

    // =========================
    // BINTANG BERKEDIP
    // =========================
    for (int i = 0; i < 180; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2 + 0.5;

      final opacity = 0.4 + 0.6 * sin(progress * 2 * pi + i);

      final starPaint = Paint()
        ..color = Colors.white.withOpacity(opacity.clamp(0.2, 1.0));

      canvas.drawCircle(Offset(dx, dy), radius, starPaint);
    }

    // =========================
    // GALAXY GLOW
    // =========================
    final center = Offset(size.width * 0.72, size.height * 0.23);

    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.purple.withOpacity(0.35),
          Colors.blue.withOpacity(0.18),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: 180),
      );

    canvas.drawCircle(center, 180, glowPaint);

    // =========================
    // GALAXY BERPUTAR
    // =========================
    final galaxyPaint = Paint()
      ..color = Colors.white.withOpacity(0.28)
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 320; i++) {
      double angle = i * 0.22 + progress * 2 * pi;
      double radius = i * 0.65;

      double x = center.dx + cos(angle) * radius;
      double y = center.dy + sin(angle) * radius * 0.42;

      canvas.drawCircle(
        Offset(x, y),
        1.7,
        galaxyPaint,
      );
    }

    // =========================
    // NEBULA
    // =========================
    final nebulaPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.pink.withOpacity(0.12),
          Colors.deepPurple.withOpacity(0.08),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * 0.18, size.height * 0.76),
          radius: 220,
        ),
      );

    canvas.drawCircle(
      Offset(size.width * 0.18, size.height * 0.76),
      220,
      nebulaPaint,
    );

    // =========================
    // COMET BERGERAK
    // =========================
    final cometX = (size.width + 200) * progress - 150;
    final cometY = size.height * 0.18 + sin(progress * 2 * pi) * 30;

    final tailPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withOpacity(0.0),
          Colors.lightBlueAccent.withOpacity(0.15),
          Colors.white.withOpacity(0.8),
        ],
      ).createShader(
        Rect.fromLTWH(cometX - 120, cometY - 10, 120, 20),
      );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cometX - 120, cometY - 2, 120, 4),
        const Radius.circular(10),
      ),
      tailPaint,
    );

    final cometPaint = Paint()
      ..color = Colors.white
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(Offset(cometX, cometY), 4.5, cometPaint);
  }

  @override
  bool shouldRepaint(covariant GalaxyPainter oldDelegate) => true;
}