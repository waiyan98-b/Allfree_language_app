enum MasteryStage {
  learningNew,
  learning,
  familiar,
  mastered,
}

class SRSItemModel {
  final String id;
  final String itemId;
  final String itemType;
  final MasteryStage stage;
  final int repetitions;
  final double easeFactor;
  final int intervalDays;
  final DateTime nextReviewDate;
  final DateTime lastReviewedDate;

  const SRSItemModel({
    required this.id,
    required this.itemId,
    required this.itemType,
    this.stage = MasteryStage.learningNew,
    this.repetitions = 0,
    this.easeFactor = 2.5,
    this.intervalDays = 0,
    required this.nextReviewDate,
    required this.lastReviewedDate,
  });

  SRSItemModel copyWith({
    MasterStage? stage,
    int? repetitions,
    double? easeFactor,
    int? intervalDays,
    DateTime? nextReviewDate,
    DateTime? lastReviewedDate,
  }) {
    return SRSItemModel(
      id: id,
      itemId: itemId,
      itemType: itemType,
      stage: stage ?? this.stage,
      repetitions: repetitions ?? this.repetitions,
      easeFactor: easeFactor ?? this.easeFactor,
      intervalDays: intervalDays ?? this.intervalDays,
      nextReviewDate: nextReviewDate ?? this.nextReviewDate,
      lastReviewedDate: lastReviewedDate ?? this.lastReviewedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'itemType': itemType,
      'stage': stage.name,
      'repetitions': repetitions,
      'easeFactor': easeFactor,
      'intervalDays': intervalDays,
      'nextReviewDate': nextReviewDate.toIso8601String(),
      'lastReviewedDate': lastReviewedDate.toIso8601String(),
    };
  }

  factory SRSItemModel.fromJson(Map<String, dynamic> json) {
    return SRSItemModel(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      itemType: json['itemType'] as String,
      stage: MasteryStage.values.firstWhere(
        (e) => e.name == json['stage'],
        orElse: () => MasteryStage.learningNew,
      ),
      repetitions: json['repetitions'] as int? ?? 0,
      easeFactor: (json['easeFactor'] as num?)?.toDouble() ?? 2.5,
      intervalDays: json['intervalDays'] as int? ?? 0,
      nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
      lastReviewedDate: DateTime.parse(json['lastReviewedDate'] as String),
    );
  }
}
