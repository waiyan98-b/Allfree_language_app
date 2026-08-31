import '../models/vocabulary_model.dart';

class ToneCalculatorService {
  static const Set<String> middleConsonants = {
    'ก', 'จ', 'ด', 'ต', 'บ', 'ป', 'อ', 'ฎ', 'ฏ'
  };

  static const Set<String> highConsonants = {
    'ข', 'ฃ', 'ฉ', 'ฐ', 'ถ', 'ผ', 'ฝ', 'ศ', 'ษ', 'ส', 'ห'
  };

  static const Set<String> lowConsonants = {
    'ค', 'ฅ', 'ฆ', 'ง', 'ช', 'ซ', 'ฌ', 'ญ', 'ฑ', 'ฒ', 'ณ', 'ท', 'ธ', 'น',
    'พ', 'ฟ', 'ภ', 'ม', 'ย', 'ร', 'ล', 'ว', 'ฬ', 'ฮ'
  };

  static const Set<String> liveEndings = {
    'ง', 'น', 'ม', 'ย', 'ว', 'ณ', 'ญ', 'ร', 'ล', 'ฬ'
  };

  static const Set<String> deadEndings = {
    'ก', 'ด', 'บ', 'ข', 'ค', 'ฆ', 'จ', 'ช', 'ซ', 'ฌ', 'ฎ', 'ฏ', 'ฐ', 'ฑ',
    'ฒ', 'ต', 'ถ', 'ท', 'ธ', 'ศ', 'ษ', 'ส', 'พ', 'ฟ', 'ภ'
  };

  static ConsonantClass getConsonantClass(String char) {
    if (middleConsonants.contains(char)) return ConsonantClass.middle;
    if (highConsonants.contains(char)) return ConsonantClass.high;
    if (lowConsonants.contains(char)) return ConsonantClass.low;
    return ConsonantClass.none;
  }

  static ThaiTone calculateTone({
    required ConsonantClass consonantClass,
    required bool isLiveSyllable,
    required bool isLongVowel,
    String? toneMark,
  }) {
    if (toneMark != null && toneMark.isNotEmpty) {
      if (toneMark.contains('่')) { // Mai Ek
        if (consonantClass == ConsonantClass.middle ||
            consonantClass == ConsonantClass.high) {
          return ThaiTone.low;
        } else {
          return ThaiTone.falling;
        }
      } else if (toneMark.contains('้')) { // Mai Tho
        if (consonantClass == ConsonantClass.middle ||
            consonantClass == ConsonantClass.high) {
          return ThaiTone.falling;
        } else {
          return ThaiTone.high;
        }
      } else if (toneMark.contains('๊')) { // Mai Tri
        return ThaiTone.high;
      } else if (toneMark.contains('๋')) { // Mai Chattawa
        return ThaiTone.rising;
      }
    }

    // No Tone Mark Rules
    if (isLiveSyllable) {
      if (consonantClass == ConsonantClass.high) {
        return ThaiTone.rising;
      }
      return ThaiTone.mid; // Middle & Low with live ending = Mid tone
    } else {
      // Dead Syllable
      if (consonantClass == ConsonantClass.middle ||
          consonantClass == ConsonantClass.high) {
        return ThaiTone.low;
      } else {
        // Low Consonant Dead Syllable
        return isLongVowel ? ThaiTone.falling : ThaiTone.high;
      }
    }
  }
}
