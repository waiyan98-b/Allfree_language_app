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
    required this.index,
    required this.title,
    required this.titleMyanmar,
    required this.cefrLevel,
    required this.description,
    this.units = const [],
    this.chapterMasteryTest = const [],
  });

  String get id => 'chapter_$index';

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'title': title,
      'titleMyanmar': titleMyanmar,
      'cefrLevel': cefrLevel,
      'description': description,
      'units': units.map((u) => u.toJson()).toList(),
      'chapterMasteryTest': chapterMasteryTest.map((e) => e.toJson()).toList(),
    };
  }

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      index: json['index'] as int,
      title: json['title'] as String,
      titleMyanmar: json['titleMyanmar'] as String,
      cefrLevel: json['cefrLevel'] as String,
      description: json['description'] as String,
      units: (json['units'] as List<dynamic>?)
              ?.map((u) => UnitModel.fromJson(u as Map<String, dynamic>))
              .toList() ??
          [],
      chapterMasteryTest: (json['chapterMasteryTest'] as List<dynamic>?)
              ?.map((e) => ExerciseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
