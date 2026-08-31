class SkillScores {
  final double listening;
  final double speaking;
  final double reading;
  final double writing;

  const SkillScores({
    this.listening = 0.0,
    this.speaking = 0.0,
    this.reading = 0.0,
    this.writing = 0.0,
  });

  SkillScores copyWith({
    double? listening,
    double? speaking,
    double? reading,
    double? writing,
  }) {
    return SkillScores(
      listening: listening ?? this.listening,
      speaking: speaking ?? this.speaking,
      reading: reading ?? this.reading,
      writing: writing ?? this.writing,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listening': listening,
      'speaking': speaking,
      'reading': reading,
      'writing': writing,
    };
  }

  factory SkillScores.fromJson(Map<String, dynamic> json) {
    return SkillScores(
      listening: (json['listening'] as num?)?.toDouble() ?? 0.0,
      speaking: (json['speaking'] as num?)?.toDouble() ?? 0.0,
      reading: (json['reading'] as num?)?.toDouble() ?? 0.0,
      writing: (json['writing'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class UserProgressModel {
  final int xp;
  final int streakDays;
  final int hearts;
  final int maxHearts;
  final String lastActiveDate;
  final Set<String> completedUnits;
  final Set<String> unlockedUnits;
  final Set<int> completedChapters;
  final SkillScores skillScores;

  const UserProgressModel({
    this.xp = 0,
    this.streakDays = 0,
    this.hearts = 5,
    this.maxHearts = 5,
    required this.lastActiveDate,
    this.completedUnits = const {},
    this.unlockedUnits = const {'ch_1_unit_1'},
    this.completedChapters = const {},
    this.skillScores = const SkillScores(),
  });

  UserProgressModel copyWith({
    int? xp,
    int? streakDays,
    int? hearts,
    int? maxHearts,
    String? lastActiveDate,
    Set<String>? completedUnits,
    Set<String>? unlockedUnits,
    Set<int>? completedChapters,
    SkillScores? skillScores,
  }) {
    return UserProgressModel(
      xp: xp ?? this.xp,
      streakDays: streakDays ?? this.streakDays,
      hearts: hearts ?? this.hearts,
      maxHearts: maxHearts ?? this.maxHearts,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      completedUnits: completedUnits ?? this.completedUnits,
      unlockedUnits: unlockedUnits ?? this.unlockedUnits,
      completedChapters: completedChapters ?? this.completedChapters,
      skillScores: skillScores ?? this.skillScores,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'xp': xp,
      'streakDays': streakDays,
      'hearts': hearts,
      'maxHearts': maxHearts,
      'lastActiveDate': lastActiveDate,
      'completedUnits': completedUnits.toList(),
      'unlockedUnits': unlockedUnits.toList(),
      'completedChapters': completedChapters.toList(),
      'skillScores': skillScores.toJson(),
    };
  }

  factory UserProgressModel.fromJson(Map<String, dynamic> json) {
    return UserProgressModel(
      xp: json['xp'] as int? ?? 0,
      streakDays: json['streakDays'] as int? ?? 0,
      hearts: json['hearts'] as int? ?? 5,
      maxHearts: json['maxHearts'] as int? ?? 5,
      lastActiveDate: json['lastActiveDate'] as String? ?? '',
      completedUnits: Set<String>.from(json['completedUnits'] as List? ?? []),
      unlockedUnits: Set<String>.from(
          json['unlockedUnits'] as List? ?? ['ch_1_unit_1']),
      completedChapters: Set<int>.from(json['completedChapters'] as List? ?? []),
      skillScores: json['skillScores'] != null
          ? SkillScores.fromJson(json['skillScores'] as Map<String, dynamic>)
          : const SkillScores(),
    );
  }
}
