import 'vocabulary_model.dart';

enum ScriptCategory {
  consonant,
  vowelShort,
  vowelLong,
  vowelCompound,
  vowelSpecial,
  toneMark,
  numeral,
}

class ScriptModel {
  final String symbol;
  final String nameThai;
  final String nameRoman;
  final String nameMyanmar;
  final ScriptCategory category;
  final ConsonantClass consonantClass;
  final String initialSound;
  final String finalSound;
  final List<List<double>> strokeOrderPath;

  const ScriptModel({
    required this.symbol,
    required this.nameThai,
    required this.nameRoman,
    required this.nameMyanmar,
    required this.category,
    this.consonantClass = ConsonantClass.none,
    this.initialSound = '',
    this.finalSound = '',
    this.strokeOrderPath = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'nameThai': nameThai,
      'nameRoman': nameRoman,
      'nameMyanmar': nameMyanmar,
      'category': category.name,
      'consonantClass': consonantClass.name,
      'initialSound': initialSound,
      'finalSound': finalSound,
      'strokeOrderPath': strokeOrderPath,
    };
  }

  factory ScriptModel.fromJson(Map<String, dynamic> json) {
    return ScriptModel(
      symbol: json['symbol'] as String,
      nameThai: json['nameThai'] as String,
      nameRoman: json['nameRoman'] as String,
      nameMyanmar: json['nameMyanmar'] as String,
      category: ScriptCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => ScriptCategory.consonant,
      ),
      consonantClass: ConsonantClass.values.firstWhere(
        (e) => e.name == json['consonantClass'],
        orElse: () => ConsonantClass.none,
      ),
      initialSound: json['initialSound'] as String? ?? '',
      finalSound: json['finalSound'] as String? ?? '',
      strokeOrderPath: (json['strokeOrderPath'] as List<dynamic>?)
              ?.map((item) => (item as List<dynamic>)
                  .map((point) => (point as num).toDouble())
                  .toList())
              .toList() ??
          [],
    );
  }
}
