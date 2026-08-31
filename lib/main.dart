import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'services/storage_service.dart';
import 'services/audio_service.dart';
import 'services/tts_service.dart';
import 'services/speech_service.dart';
import 'services/srs_service.dart';
import 'services/progress_service.dart';
import 'screens/main_navigation_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final storageService = StorageService(prefs);

  runApp(
    MultiProvider(
      providers: [
        Provider<StorageService>.value(value: storageService),
        Provider<AudioService>(create: (_) => AudioService()),
        Provider<TtsService>(create: (_) => TtsService()),
        Provider<SpeechService>(create: (_) => SpeechService()),
        Provider<SrsService>(create: (_) => SrsService(storageService)),
        ChangeNotifierProvider<ProgressService>(
          create: (_) => ProgressService(storageService),
        ),
      ],
      child: const ThaiLearningApp(),
    ),
  );
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
      home: const MainNavigationShell(),
    );
  }
}
