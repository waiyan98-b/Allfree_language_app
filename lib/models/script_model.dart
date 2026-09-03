enum ScriptCategory {
  consonant,
  vowelShort,
  vowelLong,
  vowelCompound,
  vowelSpecial,
  toneMark,
  numeral,
}

enum ConsonantClass {
  middle,
  high,
  low,
}

class ScriptModel {
  final String character;
  final String? romanization;
  final String? pronunciation;
  final ScriptCategory category;
  final ConsonantClass? consonantClass;
  final String? tone;
  final String? example;
  final String? exampleMeaning;
  final String? note;

  const ScriptModel({
    required this.character,
    this.romanization,
    this.pronunciation,
    required this.category,
    this.consonantClass,
    this.tone,
    this.example,
    this.exampleMeaning,
    this.note,
  });

  bool get isConsonant =>
      category == ScriptCategory.consonant;

  bool get isVowel =>
      category == ScriptCategory.vowelShort ||
      category == ScriptCategory.vowelLong ||
      category == ScriptCategory.vowelCompound ||
      category == ScriptCategory.vowelSpecial;

  bool get isToneMark =>
      category == ScriptCategory.toneMark;

  Map<String, dynamic> toMap() {
    return {
      'character': character,
      'romanization': romanization,
      'pronunciation': pronunciation,
      'category': category.name,
      'consonantClass': consonantClass?.name,
      'tone': tone,
      'example': example,
      'exampleMeaning': exampleMeaning,
      'note': note,
    };
  }

  factory ScriptModel.fromMap(Map<String, dynamic> map) {
    return ScriptModel(
      character: map['character'] as String? ?? '',
      romanization: map['romanization'] as String?,
      pronunciation: map['pronunciation'] as String?,
      category: ScriptCategory.values.firstWhere(
        (value) => value.name == map['category'],
        orElse: () => ScriptCategory.consonant,
      ),
      consonantClass: map['consonantClass'] == null
          ? null
          : ConsonantClass.values.firstWhere(
              (value) => value.name == map['consonantClass'],
              orElse: () => ConsonantClass.middle,
            ),
      tone: map['tone'] as String?,
      example: map['example'] as String?,
      exampleMeaning: map['exampleMeaning'] as String?,
      note: map['note'] as String?,
    );
  }
}
