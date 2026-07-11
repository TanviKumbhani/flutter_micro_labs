import 'package:flutter/material.dart';

import '../widgets/ai_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _Background(),

          Positioned(
            right: 24,
            bottom: 24,
            child: AiFab(
              onTap: () {
                debugPrint("AI Button Pressed");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0D1117),
            Color(0xff161B22),
          ],
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 15,
          itemBuilder: (_, index) {
            return Container(
              height: 85,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(.04),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}