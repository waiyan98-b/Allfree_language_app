import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ThaiLearningApp());
}

class ThaiLearningApp extends StatelessWidget {
  const ThaiLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allfree Thai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color(0xFF1E88E5),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1E88E5),
          secondary: Color(0xFFFF9800),
          surface: Color(0xFFFFFFFF),
          error: Color(0xFFE53935),
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Allfree Thai Learning App\nArchitecture Setup in Progress...',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
