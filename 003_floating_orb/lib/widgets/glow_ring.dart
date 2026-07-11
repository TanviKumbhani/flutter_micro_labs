import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class GlowRing extends StatelessWidget {
  const GlowRing({
    super.key,
    required this.size,
    required this.animation,
    required this.padding,
  });

  final double size;
  final Animation<double> animation;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final t = Curves.easeInOut.transform(animation.value);

        return SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: _GlowRingPainter(
              progress: t,
              padding: padding,
            ),
          ),
        );
      },
    );
  }
}

class _GlowRingPainter extends CustomPainter {
  const _GlowRingPainter({
    required this.progress,
    required this.padding,
  });

  final double progress;
  final double padding;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    final radius = size.width / 2 - 1.2;

    //------------------------------
    // OUTER GLOW
    //------------------------------

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        lerpDouble(12, 18, progress)!,
      )
      ..shader = SweepGradient(
        colors: const [
          Color(0xff37E6FF),
          Color(0xff56A8FF),
          Color(0xff37E6FF),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      );

    canvas.drawCircle(
      center,
      radius,
      glowPaint,
    );

    //------------------------------
    // THIN RING
    //------------------------------

    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..shader = SweepGradient(
        transform: GradientRotation(progress * math.pi * 2),
        colors: [
          Colors.white.withOpacity(.95),
          const Color(0xff59D8FF),
          const Color(0xff3388FF),
          Colors.white.withOpacity(.95),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      );

    canvas.drawCircle(
      center,
      radius,
      ringPaint,
    );

    //------------------------------
    // INNER SOFT LIGHT
    //------------------------------

    final innerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .6
      ..color = Colors.white.withOpacity(.30 + progress * .20);

    canvas.drawCircle(
      center,
      radius - 1.3,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _GlowRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}