enum ExerciseType {
  flashcard,
  multipleChoice,
  matching,
  fillInBlank,
  wordOrdering,
  translation,
  listeningChoice,
  dictation,
  speaking,
  readingComprehension,
  writingTrace,
  review,
}

abstract class ExerciseModel {
  final String id;
  final ExerciseType type;
  final String instruction;
  final String instructionMyanmar;

  const ExerciseModel({
    required this.id,
    required this.type,
    required this.instruction,
    required this.instructionMyanmar,
  });

  Map<String, dynamic> toJson();

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    final typeStr = json['type'] as String;
    final type = ExerciseType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => ExerciseType.multipleChoice,
    );

    switch (type) {
      case ExerciseType.multipleChoice:
        return MultipleChoiceExercise.fromJson(json);
      case ExerciseType.matching:
        return MatchingExercise.fromJson(json);
      case ExerciseType.fillInBlank:
        return FillInBlankExercise.fromJson(json);
      case ExerciseType.wordOrdering:
        return WordOrderingExercise.fromJson(json);
      case ExerciseType.translation:
        return TranslationExercise.fromJson(json);
      case ExerciseType.listeningChoice:
        return ListeningChoiceExercise.fromJson(json);
      case ExerciseType.dictation:
        return DictationExercise.fromJson(json);
      case ExerciseType.speaking:
        return SpeakingExercise.fromJson(json);
      case ExerciseType.readingComprehension:
        return ReadingComprehensionExercise.fromJson(json);
      case ExerciseType.writingTrace:
        return WritingTraceExercise.fromJson(json);
      case ExerciseType.flashcard:
      case ExerciseType.review:
        return FlashcardExercise.fromJson(json);
    }
  }
}

class MultipleChoiceExercise extends ExerciseModel {
  final String question;
  final String? questionAudio;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const MultipleChoiceExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.question,
    this.questionAudio,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  }) : super(type: ExerciseType.multipleChoice);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'question': question,
      'questionAudio': questionAudio,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
    };
  }

  factory MultipleChoiceExercise.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      question: json['question'] as String,
      questionAudio: json['questionAudio'] as String?,
      options: List<String>.from(json['options'] as List),
      correctIndex: json['correctIndex'] as int,
      explanation: json['explanation'] as String? ?? '',
    );
  }
}

class MatchingExercise extends ExerciseModel {
  final Map<String, String> pairs;

  const MatchingExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.pairs,
  }) : super(type: ExerciseType.matching);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'pairs': pairs,
    };
  }

  factory MatchingExercise.fromJson(Map<String, dynamic> json) {
    return MatchingExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      pairs: Map<String, String>.from(json['pairs'] as Map),
    );
  }
}

class FillInBlankExercise extends ExerciseModel {
  final String sentenceWithBlank;
  final List<String> options;
  final String correctAnswer;
  final String translationMyanmar;

  const FillInBlankExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.sentenceWithBlank,
    required this.options,
    required this.correctAnswer,
    required this.translationMyanmar,
  }) : super(type: ExerciseType.fillInBlank);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'sentenceWithBlank': sentenceWithBlank,
      'options': options,
      'correctAnswer': correctAnswer,
      'translationMyanmar': translationMyanmar,
    };
  }

  factory FillInBlankExercise.fromJson(Map<String, dynamic> json) {
    return FillInBlankExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      sentenceWithBlank: json['sentenceWithBlank'] as String,
      options: List<String>.from(json['options'] as List),
      correctAnswer: json['correctAnswer'] as String,
      translationMyanmar: json['translationMyanmar'] as String,
    );
  }
}

class WordOrderingExercise extends ExerciseModel {
  final List<String> shuffledWords;
  final List<String> correctOrder;
  final String targetTranslation;

  const WordOrderingExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.shuffledWords,
    required this.correctOrder,
    required this.targetTranslation,
  }) : super(type: ExerciseType.wordOrdering);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'shuffledWords': shuffledWords,
      'correctOrder': correctOrder,
      'targetTranslation': targetTranslation,
    };
  }

  factory WordOrderingExercise.fromJson(Map<String, dynamic> json) {
    return WordOrderingExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      shuffledWords: List<String>.from(json['shuffledWords'] as List),
      correctOrder: List<String>.from(json['correctOrder'] as List),
      targetTranslation: json['targetTranslation'] as String,
    );
  }
}

class TranslationExercise extends ExerciseModel {
  final String sourceText;
  final String expectedTranslation;
  final List<String> acceptableAlternatives;
  final bool isThaiToTarget;

  const TranslationExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.sourceText,
    required this.expectedTranslation,
    this.acceptableAlternatives = const [],
    required this.isThaiToTarget,
  }) : super(type: ExerciseType.translation);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'sourceText': sourceText,
      'expectedTranslation': expectedTranslation,
      'acceptableAlternatives': acceptableAlternatives,
      'isThaiToTarget': isThaiToTarget,
    };
  }

  factory TranslationExercise.fromJson(Map<String, dynamic> json) {
    return TranslationExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      sourceText: json['sourceText'] as String,
      expectedTranslation: json['expectedTranslation'] as String,
      acceptableAlternatives:
          List<String>.from(json['acceptableAlternatives'] as List? ?? []),
      isThaiToTarget: json['isThaiToTarget'] as bool,
    );
  }
}

class ListeningChoiceExercise extends ExerciseModel {
  final String audioAsset;
  final String spokenText;
  final List<String> options;
  final int correctIndex;

  const ListeningChoiceExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.audioAsset,
    required this.spokenText,
    required this.options,
    required this.correctIndex,
  }) : super(type: ExerciseType.listeningChoice);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'audioAsset': audioAsset,
      'spokenText': spokenText,
      'options': options,
      'correctIndex': correctIndex,
    };
  }

  factory ListeningChoiceExercise.fromJson(Map<String, dynamic> json) {
    return ListeningChoiceExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      audioAsset: json['audioAsset'] as String,
      spokenText: json['spokenText'] as String,
      options: List<String>.from(json['options'] as List),
      correctIndex: json['correctIndex'] as int,
    );
  }
}

class DictationExercise extends ExerciseModel {
  final String audioAsset;
  final String correctThaiText;
  final String romanizationHint;

  const DictationExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.audioAsset,
    required this.correctThaiText,
    required this.romanizationHint,
  }) : super(type: ExerciseType.dictation);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'audioAsset': audioAsset,
      'correctThaiText': correctThaiText,
      'romanizationHint': romanizationHint,
    };
  }

  factory DictationExercise.fromJson(Map<String, dynamic> json) {
    return DictationExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      audioAsset: json['audioAsset'] as String,
      correctThaiText: json['correctThaiText'] as String,
      romanizationHint: json['romanizationHint'] as String,
    );
  }
}

class SpeakingExercise extends ExerciseModel {
  final String targetThaiText;
  final String romanization;
  final String meaningMyanmar;
  final String? guideAudioAsset;

  const SpeakingExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.targetThaiText,
    required this.romanization,
    required this.meaningMyanmar,
    this.guideAudioAsset,
  }) : super(type: ExerciseType.speaking);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'targetThaiText': targetThaiText,
      'romanization': romanization,
      'meaningMyanmar': meaningMyanmar,
      'guideAudioAsset': guideAudioAsset,
    };
  }

  factory SpeakingExercise.fromJson(Map<String, dynamic> json) {
    return SpeakingExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      targetThaiText: json['targetThaiText'] as String,
      romanization: json['romanization'] as String,
      meaningMyanmar: json['meaningMyanmar'] as String,
      guideAudioAsset: json['guideAudioAsset'] as String?,
    );
  }
}

class ReadingComprehensionExercise extends ExerciseModel {
  final String passage;
  final String passageMyanmar;
  final String question;
  final List<String> options;
  final int correctIndex;

  const ReadingComprehensionExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.passage,
    required this.passageMyanmar,
    required this.question,
    required this.options,
    required this.correctIndex,
  }) : super(type: ExerciseType.readingComprehension);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'passage': passage,
      'passageMyanmar': passageMyanmar,
      'question': question,
      'options': options,
      'correctIndex': correctIndex,
    };
  }

  factory ReadingComprehensionExercise.fromJson(Map<String, dynamic> json) {
    return ReadingComprehensionExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      passage: json['passage'] as String,
      passageMyanmar: json['passageMyanmar'] as String,
      question: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctIndex: json['correctIndex'] as int,
    );
  }
}

class WritingTraceExercise extends ExerciseModel {
  final String targetCharacter;
  final String characterName;
  final List<List<double>> strokePoints;

  const WritingTraceExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.targetCharacter,
    required this.characterName,
    this.strokePoints = const [],
  }) : super(type: ExerciseType.writingTrace);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'targetCharacter': targetCharacter,
      'characterName': characterName,
      'strokePoints': strokePoints,
    };
  }

  factory WritingTraceExercise.fromJson(Map<String, dynamic> json) {
    return WritingTraceExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      targetCharacter: json['targetCharacter'] as String,
      characterName: json['characterName'] as String,
      strokePoints: (json['strokePoints'] as List<dynamic>?)
              ?.map((item) => (item as List<dynamic>)
                  .map((p) => (p as num).toDouble())
                  .toList())
              .toList() ??
          [],
    );
  }
}

class FlashcardExercise extends ExerciseModel {
  final String frontText;
  final String backText;
  final String? romanization;
  final String? audioAsset;

  const FlashcardExercise({
    required super.id,
    required super.instruction,
    required super.instructionMyanmar,
    required this.frontText,
    required this.backText,
    this.romanization,
    this.audioAsset,
  }) : super(type: ExerciseType.flashcard);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'instruction': instruction,
      'instructionMyanmar': instructionMyanmar,
      'frontText': frontText,
      'backText': backText,
      'romanization': romanization,
      'audioAsset': audioAsset,
    };
  }

  factory FlashcardExercise.fromJson(Map<String, dynamic> json) {
    return FlashcardExercise(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      instructionMyanmar: json['instructionMyanmar'] as String,
      frontText: json['frontText'] as String,
      backText: json['backText'] as String,
      romanization: json['romanization'] as String?,
      audioAsset: json['audioAsset'] as String?,
    );
  }
}
