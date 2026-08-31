class TtsService {
  bool _isAvailable = false;
  double _speechRate = 0.85;

  TtsService() {
    _initEngine();
  }

  bool get isAvailable => _isAvailable;
  double get speechRate => _speechRate;

  void _initEngine() {
    _isAvailable = true;
  }

  void setSpeechRate(double rate) {
    _speechRate = rate.clamp(0.5, 1.5);
  }

  Future<void> speakThai(String text) async {
    if (text.isEmpty) return;
  }

  Future<void> stop() async {}

  void dispose() {}
}
