import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
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
