import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.borderRadius = 34,
    this.blur = 18,
  });

  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          // Ambient shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 20,
            spreadRadius: -6,
            offset: const Offset(0, 8),
          ),

          // Main gravity shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .30),
            blurRadius: 60,
            spreadRadius: -18,
            offset: const Offset(0, 28),
          ),

          // Deep shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .18),
            blurRadius: 90,
            spreadRadius: -35,
            offset: const Offset(0, 48),
          ),

          // Soft top glow
          BoxShadow(
            color: Colors.white.withValues(alpha: .05),
            blurRadius: 16,
            spreadRadius: -8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: .12),
                  Colors.white.withValues(alpha: .05),
                ],
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: .32),
                width: 1.1,
              ),
            ),
            child: Stack(
              children: [
                /// Large glossy reflection
                Positioned(
                  top: -120,
                  left: -80,
                  child: Transform.rotate(
                    angle: -.55,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: .22),
                            Colors.white.withValues(alpha: .05),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                /// Top shine
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: .12),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                /// Bottom light
                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white.withValues(alpha: .03),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: padding,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}