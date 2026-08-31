class GrammarExample {
  final String thai;
  final String romanization;
  final String myanmar;
  final String english;
  final String? breakdownNote;

  const GrammarExample({
    required this.thai,
    required this.romanization,
    required this.myanmar,
    required this.english,
    this.breakdownNote,
  });

  Map<String, dynamic> toJson() {
    return {
      'thai': thai,
      'romanization': romanization,
      'myanmar': myanmar,
      'english': english,
      'breakdownNote': breakdownNote,
    };
  }

  factory GrammarExample.fromJson(Map<String, dynamic> json) {
    return GrammarExample(
      thai: json['thai'] as String,
      romanization: json['romanization'] as String,
      myanmar: json['myanmar'] as String,
      english: json['english'] as String,
      breakdownNote: json['breakdownNote'] as String?,
    );
  }
}

class GrammarModel {
  final String id;
  final String title;
  final String titleMyanmar;
  final String pattern;
  final String explanation;
  final String explanationMyanmar;
  final List<GrammarExample> examples;
  final String? culturalNote;

  const GrammarModel({
    required this.id,
    required this.title,
    required this.titleMyanmar,
    required this.pattern,
    required this.explanation,
    required this.explanationMyanmar,
    required this.examples,
    this.culturalNote,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'titleMyanmar': titleMyanmar,
      'pattern': pattern,
      'explanation': explanation,
      'explanationMyanmar': explanationMyanmar,
      'examples': examples.map((e) => e.toJson()).toList(),
      'culturalNote': culturalNote,
    };
  }

  factory GrammarModel.fromJson(Map<String, dynamic> json) {
    return GrammarModel(
      id: json['id'] as String,
      title: json['title'] as String,
      titleMyanmar: json['titleMyanmar'] as String,
      pattern: json['pattern'] as String,
      explanation: json['explanation'] as String,
      explanationMyanmar: json['explanationMyanmar'] as String,
      examples: (json['examples'] as List<dynamic>)
          .map((item) => GrammarExample.fromJson(item as Map<String, dynamic>))
          .toList(),
      culturalNote: json['culturalNote'] as String?,
    );
  }
}
