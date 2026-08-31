class DialogueLine {
  final String speaker;
  final String thai;
  final String romanization;
  final String myanmar;
  final String english;
  final String? audioAsset;
  final String? speakerAvatar;

  const DialogueLine({
    required this.speaker,
    required this.thai,
    required this.romanization,
    required this.myanmar,
    required this.english,
    this.audioAsset,
    this.speakerAvatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'speaker': speaker,
      'thai': thai,
      'romanization': romanization,
      'myanmar': myanmar,
      'english': english,
      'audioAsset': audioAsset,
      'speakerAvatar': speakerAvatar,
    };
  }

  factory DialogueLine.fromJson(Map<String, dynamic> json) {
    return DialogueLine(
      speaker: json['speaker'] as String,
      thai: json['thai'] as String,
      romanization: json['romanization'] as String,
      myanmar: json['myanmar'] as String,
      english: json['english'] as String,
      audioAsset: json['audioAsset'] as String?,
      speakerAvatar: json['speakerAvatar'] as String?,
    );
  }
}

class DialogueModel {
  final String id;
  final String context;
  final String contextMyanmar;
  final List<DialogueLine> lines;

  const DialogueModel({
    required this.id,
    required this.context,
    required this.contextMyanmar,
    required this.lines,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'context': context,
      'contextMyanmar': contextMyanmar,
      'lines': lines.map((l) => l.toJson()).toList(),
    };
  }

  factory DialogueModel.fromJson(Map<String, dynamic> json) {
    return DialogueModel(
      id: json['id'] as String,
      context: json['context'] as String,
      contextMyanmar: json['contextMyanmar'] as String,
      lines: (json['lines'] as List<dynamic>)
          .map((item) => DialogueLine.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
