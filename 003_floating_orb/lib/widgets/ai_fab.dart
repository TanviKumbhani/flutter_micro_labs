import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'animated_circle.dart';
import 'chat_icon.dart';
import 'glow_ring.dart';

class AiFab extends StatefulWidget {
  const AiFab({
    super.key,
    required this.onTap,
    this.size = 92,
  });

  final VoidCallback onTap;
  final double size;

  @override
  State<AiFab> createState() => _AiFabState();
}

class _AiFabState extends State<AiFab>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;

  late final AnimationController _pulseController;

  late final AnimationController _floatingController;

  late final AnimationController _pressController;

  late final Animation<double> _rotation;

  late final Animation<double> _pressScale;

  @override
  void initState() {
    super.initState();

//-----------------------------------------
// Background Rotation
//-----------------------------------------

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

//-----------------------------------------
// Breathing Animation
//-----------------------------------------

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);


    _rotation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    );
//-----------------------------------------
// Floating Animation
//-----------------------------------------

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat();

//-----------------------------------------
// Tap Animation
//-----------------------------------------

    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

//-----------------------------------------
// Animations
//-----------------------------------------


    _pressScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1,
          end: .90,
        ),
        weight: 45,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: .90,
          end: 1.02,
        ),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.02,
          end: 1,
        ),
        weight: 20,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _pressController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _floatingController.dispose();
    _pressController.dispose();

    super.dispose();
  }

//-----------------------------------------------------
// Gestures
//-----------------------------------------------------

  void _onTapDown(TapDownDetails details) {
    _pressController.forward();
  }

  void _onTapCancel() {
    _pressController.reverse();
  }

  Future<void> _onTapUp(
      TapUpDetails details,
      ) async {
    await _pressController.reverse();

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    const circleSize = 56.0;
    return AnimatedBuilder(
      animation: Listenable.merge([
        _rotationController,
        _pulseController,
        _floatingController,
        _pressController,
      ]),
      builder: (context, child) {
        // Floating movement
        final floatY =
            math.sin(_floatingController.value * math.pi * 2) * 2.5;

        return Transform.translate(
          offset: Offset(0, floatY),
          child: Transform.scale(
            scale: _pressScale.value,
            child: SizedBox(
              width: widget.size + 60,
              height: widget.size + 60,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [

                  //--------------------------------------------------
                  // OUTER GLOW
                  //--------------------------------------------------

                  GlowRing(
                    size: circleSize,
                    padding: 15,
                    animation: CurvedAnimation(
                      parent: _pulseController,
                      curve: Curves.easeInOut,
                    ),
                  ),

                  //--------------------------------------------------
                  // TAP AREA
                  //--------------------------------------------------

                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    onTapCancel: _onTapCancel,
                    child: SizedBox(
                      width: widget.size,
                      height: widget.size,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          //--------------------------------------------
                          // ROTATING BACKGROUND
                          //--------------------------------------------

                          AnimatedCircle(
                            size: circleSize,
                          ),

                          //--------------------------------------------
                          // CHAT ICON
                          //--------------------------------------------

                          ChatIcon(
                            size: widget.size * .50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}