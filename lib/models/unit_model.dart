import 'vocabulary_model.dart';
import 'grammar_model.dart';
import 'dialogue_model.dart';
import 'script_model.dart';
import 'exercise_model.dart';

class UnitModel {
  final int chapterIndex;
  final int unitIndex;
  final String title;
  final String titleMyanmar;
  final String level;
  final String objective;
  final String objectiveMyanmar;
  final List<ScriptModel> scriptItems;
  final List<VocabularyModel> vocabulary;
  final List<GrammarModel> grammar;
  final List<DialogueModel> dialogues;
  final List<ExerciseModel> exercises;

  const UnitModel({
    required this.chapterIndex,
    required this.unitIndex,
    required this.title,
    required this.titleMyanmar,
    required this.level,
    required this.objective,
    required this.objectiveMyanmar,
    this.scriptItems = const [],
    this.vocabulary = const [],
    this.grammar = const [],
    this.dialogues = const [],
    this.exercises = const [],
  });

  String get id => 'ch_${chapterIndex}_unit_$unitIndex';

  Map<String, dynamic> toJson() {
    return {
      'chapterIndex': chapterIndex,
      'unitIndex': unitIndex,
      'title': title,
      'titleMyanmar': titleMyanmar,
      'level': level,
      'objective': objective,
      'objectiveMyanmar': objectiveMyanmar,
      'scriptItems': scriptItems.map((s) => s.toJson()).toList(),
      'vocabulary': vocabulary.map((v) => v.toJson()).toList(),
      'grammar': grammar.map((g) => g.toJson()).toList(),
      'dialogues': dialogues.map((d) => d.toJson()).toList(),
      'exercises': exercises.map((e) => e.toJson()).toList(),
    };
  }

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      chapterIndex: json['chapterIndex'] as int,
      unitIndex: json['unitIndex'] as int,
      title: json['title'] as String,
      titleMyanmar: json['titleMyanmar'] as String,
      level: json['level'] as String,
      objective: json['objective'] as String,
      objectiveMyanmar: json['objectiveMyanmar'] as String,
      scriptItems: (json['scriptItems'] as List<dynamic>?)
              ?.map((item) => ScriptModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      vocabulary: (json['vocabulary'] as List<dynamic>?)
              ?.map((item) =>
                  VocabularyModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      grammar: (json['grammar'] as List<dynamic>?)
              ?.map((item) => GrammarModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      dialogues: (json['dialogues'] as List<dynamic>?)
              ?.map((item) =>
                  DialogueModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((item) =>
                  ExerciseModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
