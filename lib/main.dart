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
                    decoration: const InputDecoration(labelText: 'English Word *'),
                    validator: (val) => (val == null || val.trim().isEmpty) ? 'စကားလုံး ရိုက်ထည့်ပါ' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneticController,
                    decoration: const InputDecoration(labelText: 'Phonetic (အသံထွက်)'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: meaningController,
                    decoration: const InputDecoration(labelText: 'မြန်မာ အဓိပ္ပာယ် *'),
                    validator: (val) => (val == null || val.trim().isEmpty) ? 'အဓိပ္ပာယ် ရိုက်ထည့်ပါ' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: exampleController,
                    decoration: const InputDecoration(labelText: 'ဥပမာ ဝါကျ'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('မလုပ်တော့ပါ'),
            ),
            FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newWord = WordItem(
                    word: wordController.text.trim(),
                    phonetic: phoneticController.text.trim().isEmpty ? '' : phoneticController.text.trim(),
                    meaning: meaningController.text.trim(),
                    example: exampleController.text.trim().isEmpty ? '-' : exampleController.text.trim(),
                  );
                  widget.onAddWord(newWord);
                  Navigator.pop(context);
                }
              },
              child: const Text('သိမ်းဆည်းမည်'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('စကားလုံးများ (${widget.words.length})'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddWordDialog,
        icon: const Icon(Icons.add),
        label: const Text('စကားလုံး ထည့်မည်'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: widget.words.isEmpty
          ? const Center(child: Text('စကားလုံး မရှိသေးပါ။ အောက်က ခလုတ်ကို နှိပ်ပြီး ထည့်သွင်းပါ။'))
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              itemCount: widget.words.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = widget.words[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.word,
                                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                  if (item.phonetic.isNotEmpty)
                                    Text(
                                      item.phonetic,
                                      style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
                                    ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.volume_up, color: Colors.teal),
                              iconSize: 28,
                              onPressed: () => _speak(item.word),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
                              iconSize: 24,
                              onPressed: () => widget.onDeleteWord(index),
                            ),
                          ],
                        ),
                        const Divider(height: 20),
                        Text(
                          'အဓိပ္ပာယ်: ${item.meaning}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        if (item.example != '-') ...[
                          const SizedBox(height: 6),
                          Text(
                            'ဥပမာ: ${item.example}',
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final List<WordItem> words;

  const QuizScreen({super.key, required this.words});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  bool _answered = false;
  String? _selectedAnswer;
  late List<String> _options;

  @override
  void initState() {
    super.initState();
    if (widget.words.length >= 4) {
      _generateOptions();
    }
  }

  void _generateOptions() {
    _answered = false;
    _selectedAnswer = null;

    final correctAnswer = widget.words[_currentIndex].meaning;
    final otherAnswers = widget.words
        .where((item) => item.meaning != correctAnswer)
        .map((item) => item.meaning)
        .toSet()
        .toList();

    otherAnswers.shuffle(Random());
    _options = otherAnswers.take(3).toList()..add(correctAnswer);
    _options.shuffle(Random());
  }

  void _checkAnswer(String option) {
    if (_answered) return;
    setState(() {
      _answered = true;
      _selectedAnswer = option;
      if (option == widget.words[_currentIndex].meaning) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentIndex < widget.words.length - 1) {
        _currentIndex++;
        _generateOptions();
      } else {
        _showResultDialog();
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _generateOptions();
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz ပြီးဆုံးပါပြီ! 🎉'),
        content: Text('စုစုပေါင်း ရမှတ်: $_score / ${widget.words.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetQuiz();
            },
            child: const Text('ထပ်မံ ဖြေဆိုမည်'),
          ),
        ],
      ),
    );
  }

  Color _getButtonColor(String option) {
    if (!_answered) return Colors.white;
    final correctAnswer = widget.words[_currentIndex].meaning;
    if (option == correctAnswer) return Colors.green.shade100;
    if (option == _selectedAnswer && option != correctAnswer) return Colors.red.shade100;
    return Colors.white;
  }

  Color _getBorderColor(String option) {
    if (!_answered) return Colors.grey.shade300;
    final correctAnswer = widget.words[_currentIndex].meaning;
    if (option == correctAnswer) return Colors.green;
    if (option == _selectedAnswer && option != correctAnswer) return Colors.red;
    return Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.words.length < 4) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz ဖြေဆိုရန်'), centerTitle: true),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Quiz စတင်ရန် စကားလုံး အနည်းဆုံး ၄ လုံး လိုအပ်ပါသည်။',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      );
    }

    final currentWord = widget.words[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('မေးခွန်း ${_currentIndex + 1} / ${widget.words.length}'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / widget.words.length,
              backgroundColor: Colors.grey.shade200,
              color: Colors.teal,
            ),
            const SizedBox(height: 32),
            const Text(
              'မှန်ကန်သော အဓိပ္ပာယ်ကို ရွေးပါ:',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              currentWord.word,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 32),
            ..._options.map((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  onTap: () => _checkAnswer(option),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                      color: _getButtonColor(option),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _getBorderColor(option), width: 2),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            if (_answered)
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _nextQuestion,
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: Text(
                    _currentIndex < widget.words.length - 1 ? 'နောက်တစ်ခု' : 'ရမှတ် ကြည့်မည်',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
