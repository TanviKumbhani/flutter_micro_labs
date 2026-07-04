import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background Image
          Image.asset(
            'assets/images/wheather.png',
            fit: BoxFit.cover,
          ),

          /// Dark Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.12),
                  Colors.black.withOpacity(.20),
                  Colors.black.withOpacity(.32),
                ],
              ),
            ),
          ),

          /// Content
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                  size.height - MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * .15),

                    Text(
                      '29°',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Surat',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Mostly Sunny',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 50),

                    /// Floating Weather Card
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final t = Curves.easeInOut.transform(_controller.value);

                        // Float between -8 and +8 pixels
                        final offset = lerpDouble(-8, 8, t)!;

                        return Transform.translate(
                          offset: Offset(0, offset),
                          child: child,
                        );
                      },
                      child: const WeatherCard(),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}