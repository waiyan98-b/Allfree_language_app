import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const OpenLanguageApp());
}

class OpenLanguageApp extends StatelessWidget {
  const OpenLanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Free Language App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class WordItem {
  final String word;
  final String phonetic;
  final String meaning;
  final String example;

  const WordItem({
    required this.word,
    required this.phonetic,
    required this.meaning,
    required this.example,
  });

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'phonetic': phonetic,
      'meaning': meaning,
      'example': example,
    };
  }

  factory WordItem.fromMap(Map<String, dynamic> map) {
    return WordItem(
      word: map['word'] ?? '',
      phonetic: map['phonetic'] ?? '',
      meaning: map['meaning'] ?? '',
      example: map['example'] ?? '',
    );
  }
}

final List<WordItem> defaultWords = [
  const WordItem(
    word: 'Hello',
    phonetic: '/həˈloʊ/',
    meaning: 'မင်္ဂလာပါ',
    example: 'Hello! How are you doing today?',
  ),
  const WordItem(
    word: 'Gratitude',
    phonetic: '/ˈɡræt.ɪ.tʃuːd/',
    meaning: 'ကျေးဇူးတင်ရှိခြင်း',
    example: 'She expressed her deep gratitude to everyone.',
  ),
  const WordItem(
    word: 'Opportunity',
    phonetic: '/ˌɑː.pɚˈtuː.nə.t̬i/',
    meaning: 'အခွင့်အလမ်း / အခွင့်အရေး',
    example: 'Learning a language opens new opportunities.',
  ),
  const WordItem(
    word: 'Perseverance',
    phonetic: '/ˌpɝː.səˈvɪr.əns/',
    meaning: 'ဇွဲလုံ့လ / မဆုတ်မနစ် ကြိုးစားမှု',
    example: 'Success requires patience and perseverance.',
  ),
  const WordItem(
    word: 'Confidence',
    phonetic: '/ˈkɑːn.fə.dəns/',
    meaning: 'ယုံကြည်မှု',
    example: 'Speaking daily builds your confidence.',
  ),
  const WordItem(
    word: 'Curiosity',
    phonetic: '/ˌkjʊr.iˈɑː.sə.t̬i/',
    meaning: 'စူးစမ်းလိုစိတ်',
    example: 'Children have a natural curiosity about the world.',
  ),
];

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  List<WordItem> _words = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  Future<void> _loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString('custom_words_list');

    if (savedData != null) {
      final List<dynamic> decodedList = jsonDecode(savedData);
      setState(() {
        _words = decodedList.map((item) => WordItem.fromMap(item)).toList();
        _isLoading = false;
      });
    } else {
      setState(() {
        _words = List.from(defaultWords);
        _isLoading = false;
      });
      _saveWords();
    }
  }

  Future<void> _saveWords() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(_words.map((e) => e.toMap()).toList());
    await prefs.setString('custom_words_list', encodedData);
  }

  void _addNewWord(WordItem newWord) {
    setState(() {
      _words.insert(0, newWord);
    });
    _saveWords();
  }

  void _deleteWord(int index) {
    setState(() {
      _words.removeAt(index);
    });
    _saveWords();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final screens = [
      VocabularyScreen(
        words: _words,
        onAddWord: _addNewWord,
        onDeleteWord: _deleteWord,
      ),
      QuizScreen(words: _words),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'လေ့လာရန်',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz),
            label: 'Quiz ဖြေရန်',
          ),
        ],
      ),
    );
  }
}

class VocabularyScreen extends StatefulWidget {
  final List<WordItem> words;
  final Function(WordItem) onAddWord;
  final Function(int) onDeleteWord;

  const VocabularyScreen({
    super.key,
    required this.words,
    required this.onAddWord,
    required this.onDeleteWord,
  });

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  void _showAddWordDialog() {
    final formKey = GlobalKey<FormState>();
    final wordController = TextEditingController();
    final phoneticController = TextEditingController();
    final meaningController = TextEditingController();
    final exampleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('စကားလုံးအသစ် ထည့်သွင်းရန်'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: wordController,
                    decoration: const InputDecoration(
                      labelText: 'English Word *',
                      hintText: 'e.g. Resilience',
                    ),
                    validator: (val) =>
                        (val == null || val.trim().isEmpty) ? 'စကားလုံး ရိုက်ထည့်ပါ' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneticController,
                    decoration: const InputDecoration(
                      labelText: 'Phonetic (အသံထွက်)',
                      hintText: 'e.g. /rɪˈzɪl.jəns/',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: meaningController,
                    decoration: const InputDecoration(
                      labelText: 'မြန်မာ အဓိပ္ပာယ် *',
                      hintText: 'e.g. ကြံ့ကြံ့ခံနိုင်စွမ်း',
                    ),
                    validator: (val) =>
                        (val == null || val.trim().isEmpty) ? 'အဓိပ္ပာယ် ရိုက်ထည့်ပါ' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: exampleController,
                    decoration: const InputDecoration(
