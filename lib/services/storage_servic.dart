import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  // --------------------------------------------------
  // Generic String
  // --------------------------------------------------

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  // --------------------------------------------------
  // Generic Integer
  // --------------------------------------------------

  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  // --------------------------------------------------
  // Generic Boolean
  // --------------------------------------------------

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  // --------------------------------------------------
  // Generic Double
  // --------------------------------------------------

  Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  // --------------------------------------------------
  // Remove / Clear
  // --------------------------------------------------

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  // --------------------------------------------------
  // User Progress
  // --------------------------------------------------

  Future<void> saveUnitCompleted(
    int chapterIndex,
    int unitIndex,
    bool completed,
  ) async {
    final key = 'unit_${chapterIndex}_$unitIndex';
    await _prefs.setBool(key, completed);
  }

  bool isUnitCompleted(
    int chapterIndex,
    int unitIndex,
  ) {
    final key = 'unit_${chapterIndex}_$unitIndex';
    return _prefs.getBool(key) ?? false;
  }

  // --------------------------------------------------
  // XP
  // --------------------------------------------------

  Future<void> saveXp(int xp) async {
    await _prefs.setInt('total_xp', xp);
  }

  int getXp() {
    return _prefs.getInt('total_xp') ?? 0;
  }

  // --------------------------------------------------
  // Streak
  // --------------------------------------------------

  Future<void> saveStreak(int streak) async {
    await _prefs.setInt('streak', streak);
  }

  int getStreak() {
    return _prefs.getInt('streak') ?? 0;
  }

  // --------------------------------------------------
  // Hearts
  // --------------------------------------------------

  Future<void> saveHearts(int hearts) async {
    await _prefs.setInt('hearts', hearts);
  }

  int getHearts() {
    return _prefs.getInt('hearts') ?? 5;
  }

  // --------------------------------------------------
  // Daily Goal
  // --------------------------------------------------

  Future<void> saveDailyGoal(int goal) async {
    await _prefs.setInt('daily_goal', goal);
  }

  int getDailyGoal() {
    return _prefs.getInt('daily_goal') ?? 20;
  }

  // --------------------------------------------------
  // Generic List<String>
  // --------------------------------------------------

  Future<void> setStringList(
    String key,
    List<String> value,
  ) async {
    await _prefs.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }
}
