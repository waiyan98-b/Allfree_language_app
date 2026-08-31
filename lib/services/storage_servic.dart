import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/progress_model.dart';
import '../models/srs_item_model.dart';

class StorageService {
  static const String _keyUserProgress = 'user_progress_data_v1';
  static const String _keySrsPrefix = 'srs_item_';
  static const String _keySettingsPrefix = 'setting_';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  // --- User Progress Persistence ---

  Future<bool> saveProgress(UserProgressModel progress) async {
    final jsonString = jsonEncode(progress.toJson());
    return await _prefs.setString(_keyUserProgress, jsonString);
  }

  UserProgressModel loadProgress() {
    final raw = _prefs.getString(_keyUserProgress);
    if (raw == null || raw.isEmpty) {
      final todayStr = DateTime.now().toIso8601String().split('T').first;
      return UserProgressModel(
        lastActiveDate: todayStr,
        unlockedUnits: const {'ch_1_unit_1'},
      );
    }
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return UserProgressModel.fromJson(map);
    } catch (_) {
      final todayStr = DateTime.now().toIso8601String().split('T').first;
      return UserProgressModel(
        lastActiveDate: todayStr,
        unlockedUnits: const {'ch_1_unit_1'},
      );
    }
  }

  // --- Spaced Repetition (SRS) Persistence ---

  Future<bool> saveSrsItem(SRSItemModel item) async {
    final jsonString = jsonEncode(item.toJson());
    return await _prefs.setString('$_keySrsPrefix${item.id}', jsonString);
  }

  List<SRSItemModel> loadAllSrsItems() {
    final List<SRSItemModel> items = [];
    final keys = _prefs.getKeys().where((k) => k.startsWith(_keySrsPrefix));

    for (final key in keys) {
      final raw = _prefs.getString(key);
      if (raw != null && raw.isNotEmpty) {
        try {
          final map = jsonDecode(raw) as Map<String, dynamic>;
          items.add(SRSItemModel.fromJson(map));
        } catch (_) {}
      }
    }
    return items;
  }

  // --- Generic Key-Value Settings ---

  Future<bool> setBoolSetting(String key, bool value) async {
    return await _prefs.setBool('$_keySettingsPrefix$key', value);
  }

  bool getBoolSetting(String key, {bool defaultValue = true}) {
    return _prefs.getBool('$_keySettingsPrefix$key') ?? defaultValue;
  }
}
