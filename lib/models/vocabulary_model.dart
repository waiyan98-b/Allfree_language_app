enum ThaiTone {
  mid,
  low,
  falling,
  high,
  rising,
}

enum ConsonantClass {
  middle,
  high,
  low,
  none,
}

class SyllableDecomposition {
  final String syllable;
  final String initialConsonant;
  final ConsonantClass consonantClass;
  final String vowel;
  final bool isLongVowel;
  final String finalConsonant;
  final bool isLiveSyllable;
  final String? toneMark;
  final ThaiTone tone;

  const SyllableDecomposition({
    required this.syllable,
    required this.initialConsonant,
    required this.consonantClass,
    required this.vowel,
    required this.isLongVowel,
    this.finalConsonant = '',
    required this.isLiveSyllable,
    this.toneMark,
    required this.tone,
  });

  Map<String, dynamic> toJson() {
    return {
      'syllable': syllable,
      'initialConsonant': initialConsonant,
      'consonantClass': consonantClass.name,
      'vowel': vowel,
      'isLongVowel': isLongVowel,
      'finalConsonant': finalConsonant,
      'isLiveSyllable': isLiveSyllable,
      'toneMark': toneMark,
      'tone': tone.name,
    };
  }

  factory SyllableDecomposition.fromJson(Map<String, dynamic> json) {
    return SyllableDecomposition(
      syllable: json['syllable'] as String,
      initialConsonant: json['initialConsonant'] as String,
      consonantClass: ConsonantClass.values.firstWhere(
        (e) => e.name == json['consonantClass'],
        orElse: () => ConsonantClass.none,
      ),
      vowel: json['vowel'] as String,
      isLongVowel: json['isLongVowel'] as bool,
      finalConsonant: json['finalConsonant'] as String? ?? '',
      isLiveSyllable: json['isLiveSyllable'] as bool,
      toneMark: json['toneMark'] as String?,
      tone: ThaiTone.values.firstWhere(
        (e) => e.name == json['tone'],
        orElse: () => ThaiTone.mid,
      ),
    );
  }
}

class VocabularyModel {
  final String id;
  final String thai;
  final String romanization;
  final String myanmarMeaning;
  final String englishMeaning;
  final ThaiTone primaryTone;
  final String partOfSpeech;
  final String? audioAsset;
  final String? classifier;
  final String? register;
  final List<SyllableDecomposition> syllables;
  final String? exampleThai;
  final String? exampleRomanization;
  final String? exampleMyanmar;

  const VocabularyModel({
    required this.id,
    required this.thai,
    required this.romanization,
    required this.myanmarMeaning,
    required this.englishMeaning,
    this.primaryTone = ThaiTone.mid,
    this.partOfSpeech = 'noun',
    this.audioAsset,
    this.classifier,
    this.register,
    this.syllables = const [],
    this.exampleThai,
    this.exampleRomanization,
    this.exampleMyanmar,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'thai': thai,
      'romanization': romanization,
      'myanmarMeaning': myanmarMeaning,
      'englishMeaning': englishMeaning,
      'primaryTone': primaryTone.name,
      'partOfSpeech': partOfSpeech,
      'audioAsset': audioAsset,
      'classifier': classifier,
      'register': register,
      'syllables': syllables.map((s) => s.toJson()).toList(),
      'exampleThai': exampleThai,
      'exampleRomanization': exampleRomanization,
      'exampleMyanmar': exampleMyanmar,
    };
  }

  factory VocabularyModel.fromJson(Map<String, dynamic> json) {
    return VocabularyModel(
      id: json['id'] as String,
      thai: json['thai'] as String,
      romanization: json['romanization'] as String,
      myanmarMeaning: json['myanmarMeaning'] as String,
      englishMeaning: json['englishMeaning'] as String,
      primaryTone: ThaiTone.values.firstWhere(
        (e) => e.name == json['primaryTone'],
        orElse: () => ThaiTone.mid,
      ),
      partOfSpeech: json['partOfSpeech'] as String? ?? 'noun',
      audioAsset: json['audioAsset'] as String?,
      classifier: json['classifier'] as String?,
      register: json['register'] as String?,
      syllables: (json['syllables'] as List<dynamic>?)
              ?.map((item) =>
                  SyllableDecomposition.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      exampleThai: json['exampleThai'] as String?,
      exampleRomanization: json['exampleRomanization'] as String?,
      exampleMyanmar: json['exampleMyanmar'] as String?,
    );
  }
}

