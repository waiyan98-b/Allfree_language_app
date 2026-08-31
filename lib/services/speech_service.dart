import 'dart:math';

abstract class ISpeechService {
  Future<bool> initialize();
  Future<void> startListening({required Function(String recognizedWords) onResult});
  Future<void> stopListening();
  double calculatePhoneticSimilarity(String targetText, String spokenText);
}

class SpeechService implements ISpeechService {
  bool _isInitialized = false;

  @override
  Future<bool> initialize() async {
    _isInitialized = true;
    return _isInitialized;
  }

  @override
  Future<void> startListening({
    required Function(String recognizedWords) onResult,
  }) async {
    if (!_isInitialized) await initialize();
  }

  @override
  Future<void> stopListening() async {}

  @override
  double calculatePhoneticSimilarity(String target, String spoken) {
    final cleanTarget = _normalizeThai(target);
    final cleanSpoken = _normalizeThai(spoken);

    if (cleanTarget.isEmpty || cleanSpoken.isEmpty) return 0.0;
    if (cleanTarget == cleanSpoken) return 1.0;

    final distance = _levenshteinDistance(cleanTarget, cleanSpoken);
    final maxLen = max(cleanTarget.length, cleanSpoken.length);
    if (maxLen == 0) return 1.0;

    final similarity = 1.0 - (distance / maxLen);
    return similarity.clamp(0.0, 1.0);
  }

  String _normalizeThai(String input) {
    return input.replaceAll(RegExp(r'[\s\.\,\!\?\-]'), '').trim();
  }

  int _levenshteinDistance(String s1, String s2) {
    final len1 = s1.length;
    final len2 = s2.length;
    final d = List.generate(len1 + 1, (_) => List.filled(len2 + 1, 0));

    for (int i = 0; i <= len1; i++) {
      d[i][0] = i;
    }
    for (int j = 0; j <= len2; j++) {
      d[0][j] = j;
    }

    for (int i = 1; i <= len1; i++) {
      for (int j = 1; j <= len2; j++) {
        final cost = (s1[i - 1] == s2[j - 1]) ? 0 : 1;
        d[i][j] = [
          d[i - 1][j] + 1,
          d[i][j - 1] + 1,
          d[i - 1][j - 1] + cost,
        ].reduce(min);
      }
    }
    return d[len1][len2];
  }
}
