import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeatherGlassApp());
}

class WeatherGlassApp extends StatelessWidget {
  const WeatherGlassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Micro Lab #002',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}