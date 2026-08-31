import 'package:flutter/foundation.dart';
import '../models/progress_model.dart';
import 'storage_service.dart';

class ProgressService extends ChangeNotifier {
  final StorageService _storage;
  late UserProgressModel _progress;

  ProgressService(this._storage) {
    _progress = _storage.loadProgress();
    _checkStreak();
  }

  UserProgressModel get progress => _progress;
  int get xp => _progress.xp;
  int get streak => _progress.streakDays;
  int get hearts => _progress.hearts;
  Set<String> get completedUnits => _progress.completedUnits;
  Set<String> get unlockedUnits => _progress.unlockedUnits;

  void _checkStreak() {
    final today = DateTime.now();
    final todayStr = today.toIso8601String().split('T').first;

    if (_progress.lastActiveDate.isEmpty) {
      _progress = _progress.copyWith(lastActiveDate: todayStr, streakDays: 1);
      _storage.saveProgress(_progress);
      return;
    }

    final lastActive = DateTime.tryParse(_progress.lastActiveDate);
    if (lastActive != null) {
      final difference = today.difference(lastActive).inDays;
      if (difference == 1) {
        _progress = _progress.copyWith(
          streakDays: _progress.streakDays + 1,
          lastActiveDate: todayStr,
        );
        _storage.saveProgress(_progress);
      } else if (difference > 1) {
        _progress = _progress.copyWith(
          streakDays: 1,
          lastActiveDate: todayStr,
        );
        _storage.saveProgress(_progress);
      }
    }
  }

  Future<void> addXp(int amount) async {
    _progress = _progress.copyWith(xp: _progress.xp + amount);
    await _storage.saveProgress(_progress);
    notifyListeners();
  }

  Future<void> consumeHeart() async {
    if (_progress.hearts > 0) {
      _progress = _progress.copyWith(hearts: _progress.hearts - 1);
      await _storage.saveProgress(_progress);
      notifyListeners();
    }
  }

  Future<void> refillHearts() async {
    _progress = _progress.copyWith(hearts: _progress.maxHearts);
    await _storage.saveProgress(_progress);
    notifyListeners();
  }

  bool isUnitUnlocked(int chapter, int unit) {
    return _progress.unlockedUnits.contains('ch_${chapter}_unit_$unit');
  }

  bool isUnitCompleted(int chapter, int unit) {
    return _progress.completedUnits.contains('ch_${chapter}_unit_$unit');
  }

  Future<void> completeUnit({
    required int chapter,
    required int unit,
    required int earnedXp,
    double listeningDelta = 0.0,
    double speakingDelta = 0.0,
    double readingDelta = 0.0,
    double writingDelta = 0.0,
  }) async {
    final currentUnitId = 'ch_${chapter}_unit_$unit';
    final updatedCompleted = Set<String>.from(_progress.completedUnits)..add(currentUnitId);
    final updatedUnlocked = Set<String>.from(_progress.unlockedUnits);

    if (unit < 20) {
      updatedUnlocked.add('ch_${chapter}_unit_${unit + 1}');
    } else {
      final updatedChapters = Set<int>.from(_progress.completedChapters)..add(chapter);
      if (chapter < 12) {
        updatedUnlocked.add('ch_${chapter + 1}_unit_1');
      }
      _progress = _progress.copyWith(completedChapters: updatedChapters);
    }

    final newScores = _progress.skillScores.copyWith(
      listening: (_progress.skillScores.listening + listeningDelta).clamp(0.0, 100.0),
      speaking: (_progress.skillScores.speaking + speakingDelta).clamp(0.0, 100.0),
      reading: (_progress.skillScores.reading + readingDelta).clamp(0.0, 100.0),
      writing: (_progress.skillScores.writing + writingDelta).clamp(0.0, 100.0),
    );

    _progress = _progress.copyWith(
      xp: _progress.xp + earnedXp,
      completedUnits: updatedCompleted,
      unlockedUnits: updatedUnlocked,
      skillScores: newScores,
    );

    await _storage.saveProgress(_progress);
    notifyListeners();
  }
}
