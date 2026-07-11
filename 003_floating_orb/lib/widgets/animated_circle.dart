import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedCircle extends StatelessWidget {
  const AnimatedCircle({
    super.key,
    required this.size,
    this.asset = 'assets/images/circle.svg',
  });

  final double size;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 1),
      child: SvgPicture.asset(
        asset,
        width: 56,
        height: 56,
      ),
    );
  }
}