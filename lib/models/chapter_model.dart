import 'unit_model.dart';
import 'exercise_model.dart';

class ChapterModel {
  final int index;
  final String title;
  final String titleMyanmar;
  final String cefrLevel;
  final String description;
  final List<UnitModel> units;
  final List<ExerciseModel> chapterMasteryTest;

  const ChapterModel({
    int? index,
    int? number,
    required this.title,
    required this.titleMyanmar,
    required this.cefrLevel,
    this.description = '',
    int? unitsCount,
    this.units = const [],
    this.chapterMasteryTest = const [],
  }) : index = index ?? number ?? 0;

  /// Backward compatibility for curriculum data
  int get number => index;

  /// Number of units planned for this chapter.
  ///
  /// If unitsCount is not explicitly supplied, the actual
  /// number of units in [units] is used.
  int get unitsCount => units.length;

  bool get hasUnits => units.isNotEmpty;

  bool get hasMasteryTest => chapterMasteryTest.isNotEmpty;

  int get completedUnitCount {
    return units.where((unit) => unit.isCompleted).length;
  }

  double get progress {
    if (units.isEmpty) return 0.0;
    return completedUnitCount / units.length;
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'number': number,
      'title': title,
      'titleMyanmar': titleMyanmar,
      'cefrLevel': cefrLevel,
      'description': description,
      'unitsCount': unitsCount,
      'units': units.map((unit) => unit.toMap()).toList(),
      'chapterMasteryTest':
          chapterMasteryTest.map((exercise) => exercise.toMap()).toList(),
    };
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      index: map['index'] as int? ?? map['number'] as int? ?? 0,
      title: map['title'] as String? ?? '',
      titleMyanmar: map['titleMyanmar'] as String? ?? '',
      cefrLevel: map['cefrLevel'] as String? ?? '',
      description: map['description'] as String? ?? '',
      units: (map['units'] as List<dynamic>? ?? [])
          .map(
            (item) => UnitModel.fromMap(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
      chapterMasteryTest:
          (map['chapterMasteryTest'] as List<dynamic>? ?? [])
              .map(
                (item) => ExerciseModel.fromMap(
                  Map<String, dynamic>.from(item as Map),
                ),
              )
              .toList(),
    );
  }
}
