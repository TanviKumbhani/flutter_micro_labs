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

  late final Animation<double> _glow;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _glow = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _scale = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _startLoop();
  }

  Future<void> _startLoop() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) break;

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
      animation: _controller,
      builder: (_, __) {
        return Transform.scale(
          scale: _scale.value,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(
                    0.45 * _glow.value,
                  ),
                  blurRadius: 12 * _glow.value,
                  spreadRadius: 2 * _glow.value,
                ),
              ],
            ),
            child: SvgPicture.asset(
              widget.asset,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Color.lerp(
                  Colors.white,
                  const Color(0xffB8F4FF),
                  _glow.value,
                )!,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}