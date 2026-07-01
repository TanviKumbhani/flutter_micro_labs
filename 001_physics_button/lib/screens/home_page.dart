import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/physics_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Flutter Micro Lab",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "#001 • Physics Button",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 80),

                PhysicsButton(
                  text: "Tap Me",
                  onTap: () {
                    debugPrint("Button Pressed");
                  },
                ),

                const SizedBox(height: 70),

                const Text(
                  "Features",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 20),

                const FeatureTile("✓ Squish Animation"),
                const FeatureTile("✓ Elastic Bounce"),
                const FeatureTile("✓ Dynamic Shadow"),
                const FeatureTile("✓ Scale Effect"),
                const FeatureTile("✓ Zero Packages"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String text;

  const FeatureTile(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}