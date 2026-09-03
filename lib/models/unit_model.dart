import 'script_model.dart';
import 'vocabulary_model.dart';
import 'grammar_model.dart';
import 'dialogue_model.dart';
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

  final bool isCompleted;

  const UnitModel({
    required this.chapterIndex,
    required this.unitIndex,
    required this.title,
    required this.titleMyanmar,
    required this.level,
    required this.objective,
    this.objectiveMyanmar = '',
    this.scriptItems = const [],
    this.vocabulary = const [],
    this.grammar = const [],
    this.dialogues = const [],
    this.exercises = const [],
    this.isCompleted = false,
  });

  String get id => 'ch${chapterIndex}_unit$unitIndex';

  String get displayUnitNumber => '$chapterIndex.$unitIndex';

  bool get hasScript => scriptItems.isNotEmpty;

  bool get hasVocabulary => vocabulary.isNotEmpty;

  bool get hasGrammar => grammar.isNotEmpty;

  bool get hasDialogues => dialogues.isNotEmpty;

  bool get hasExercises => exercises.isNotEmpty;

  UnitModel copyWith({
    int? chapterIndex,
    int? unitIndex,
    String? title,
    String? titleMyanmar,
    String? level,
    String? objective,
    String? objectiveMyanmar,
    List<ScriptModel>? scriptItems,
    List<VocabularyModel>? vocabulary,
    List<GrammarModel>? grammar,
    List<DialogueModel>? dialogues,
    List<ExerciseModel>? exercises,
    bool? isCompleted,
  }) {
    return UnitModel(
      chapterIndex: chapterIndex ?? this.chapterIndex,
      unitIndex: unitIndex ?? this.unitIndex,
      title: title ?? this.title,
      titleMyanmar: titleMyanmar ?? this.titleMyanmar,
      level: level ?? this.level,
      objective: objective ?? this.objective,
      objectiveMyanmar: objectiveMyanmar ?? this.objectiveMyanmar,
      scriptItems: scriptItems ?? this.scriptItems,
      vocabulary: vocabulary ?? this.vocabulary,
      grammar: grammar ?? this.grammar,
      dialogues: dialogues ?? this.dialogues,
      exercises: exercises ?? this.exercises,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
