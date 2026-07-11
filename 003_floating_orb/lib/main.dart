import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MicroLabApp());
}

class MicroLabApp extends StatelessWidget {
  const MicroLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Micro Lab',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff0D1117),
      ),
      home: const HomePage(),
    );
  }
}