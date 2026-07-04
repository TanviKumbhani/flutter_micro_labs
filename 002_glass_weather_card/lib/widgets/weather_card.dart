import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          // Close contact shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .20),
            blurRadius: 18,
            spreadRadius: -6,
            offset: const Offset(0, 8),
          ),

          // Main gravity shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .45),
            blurRadius: 70,
            spreadRadius: -15,
            offset: const Offset(0, 32),
          ),

          // Long soft shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .28),
            blurRadius: 120,
            spreadRadius: -30,
            offset: const Offset(0, 65),
          ),

          // Bottom ambient shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 160,
            spreadRadius: -55,
            offset: const Offset(0, 95),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 22,
            sigmaY: 22,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: .12),
                  Colors.white.withValues(alpha: .03),
                ],
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: .28),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// TOP SECTION
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Sun Glow
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withValues(alpha: .55),
                            blurRadius: 60,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/cloud.png',
                          width: 52,
                          height: 52,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// TEXT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.thermostat,
                                size: 18,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "25°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.water_drop,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "14%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "New York",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "Mostly Sunny",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withValues(alpha: .70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                /// Divider
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.white.withValues(alpha: .12),
                ),

                const SizedBox(height: 16),

                /// Forecast
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _Forecast(day: "MON", icon: Icons.umbrella, temp: "21°"),
                    _Forecast(day: "TUE", icon: Icons.cloud, temp: "19°"),
                    _Forecast(day: "WED", icon: Icons.wb_cloudy, temp: "16°"),
                    _Forecast(day: "THU", icon: Icons.cloud_queue, temp: "19°"),
                    _Forecast(day: "FRI", icon: Icons.water_drop, temp: "20°"),
                    _Forecast(day: "SAT", icon: Icons.wb_sunny, temp: "25°"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Forecast extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temp;

  const _Forecast({
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .70),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Icon(
          icon,
          size: 18,
          color: Colors.white.withValues(alpha: .90),
        ),
        const SizedBox(height: 6),
        Text(
          temp,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}