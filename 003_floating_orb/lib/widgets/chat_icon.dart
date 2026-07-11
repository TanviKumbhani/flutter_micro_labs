import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatIcon extends StatefulWidget {
  const ChatIcon({
    super.key,
    required this.size,
    this.asset = 'assets/images/chat.svg',
  });

  final double size;
  final String asset;

  @override
  State<ChatIcon> createState() => _ChatIconState();
}

class _ChatIconState extends State<ChatIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _rotation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -0.17, // -10°
        ),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -0.17,
          end: 0.17, // +10°
        ),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.17,
          end: -0.10, // -6°
        ),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -0.10,
          end: 0.0,
        ),
        weight: 20,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _startLoop();
  }

  Future<void> _startLoop() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      await _controller.forward();
      await _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotation,
      builder: (_, __) {
        return Transform.rotate(
          angle: _rotation.value,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            widget.asset,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}