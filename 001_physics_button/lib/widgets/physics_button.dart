import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class PhysicsButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const PhysicsButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  State<PhysicsButton> createState() => _PhysicsButtonState();
}

class _PhysicsButtonState extends State<PhysicsButton> {
  bool _pressed = false;

  void _pressDown() {
    if (_pressed) return;

    setState(() {
      _pressed = true;
    });
  }

  void _pressUp() {
    if (!_pressed) return;

    setState(() {
      _pressed = false;
    });

    widget.onTap?.call();
  }

  void _cancel() {
    if (!_pressed) return;

    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressDown(),
      onTapUp: (_) => _pressUp(),
      onTapCancel: _cancel,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        scale: _pressed ? 0.94 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 650),
          curve: Curves.elasticOut,
          transform: Matrix4.translationValues(
            0,
            _pressed ? 6 : 0,
            0,
          ),
          width: 220,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [
                AppColors.blue,
                AppColors.blueDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: _pressed ? 8 : 22,
                spreadRadius: _pressed ? 1 : 3,
                offset: Offset(
                  0,
                  _pressed ? 4 : 14,
                ),
              ),
            ],
          ),
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              style: TextStyle(
                color: Colors.white,
                fontSize: _pressed ? 21 : 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
              ),
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}