import '../models/chapter_model.dart';
import '../models/unit_model.dart';
import '../models/vocabulary_model.dart';
import '../models/grammar_model.dart';
import '../models/dialogue_model.dart';
import '../models/script_model.dart';
import '../models/exercise_model.dart';

class CurriculumData {
  static List<ChapterModel> getChapters() {
    return [
      ChapterModel(
        chapterIndex: 1,
        title: 'Thai Script & Phonetics Foundation',
        titleMyanmar: 'ထိုင်းစာအခြေခံ၊ အက္ခရာ၊ သရနှင့် အသံထွက် ဥပဒေသများ',
        cefrLevel: 'A1',
        unitsCount: 20,
        units: _getChapter1Units(),
      ),
      ChapterModel(
        chapterIndex: 2,
        title: 'Greetings, Introductions & Politeness',
        titleMyanmar: 'နှုတ်ဆက်ခြင်း၊ မိတ်ဆက်ခြင်းနှင့် ယဉ်ကျေးသော စကားပြောပုံစံများ',
        cefrLevel: 'A1',
        unitsCount: 20,
        units: _getChapter2Units(),
      ),
      const ChapterModel(
        chapterIndex: 3,
        title: 'Numbers, Time, Calendar & Scheduling',
        titleMyanmar: 'ဂဏန်းသင်္ချာ၊ အချိန်၊ ပြက္ခဒိန်နှင့် ရက်စွဲများ',
        cefrLevel: 'A1',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 4,
        title: 'Food, Dining & Ordering Street Food',
        titleMyanmar: 'အစားအသောက်၊ စားသောက်ဆိုင်နှင့် လမ်းဘေးအစားအစာ မှာယူခြင်း',
        cefrLevel: 'A1-A2',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 5,
        title: 'Shopping, Bargaining & Money Matters',
        titleMyanmar: 'ဈေးဝယ်ခြင်း၊ ဈေးဆစ်ခြင်းနှင့် ငွေကြေးဆိုင်ရာ အသုံးအနှုန်းများ',
        cefrLevel: 'A2',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 6,
        title: 'Directions, Travel & Public Transport',
        titleMyanmar: 'လမ်းညွှန်ချက်များ၊ ခရီးသွားခြင်းနှင့် အများသုံးသယ်ယူပို့ဆောင်ရေး',
        cefrLevel: 'A2',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 7,
        title: 'Daily Life, Family, Home & Hobbies',
        titleMyanmar: 'နေ့စဉ်ဘဝ၊ မိသားစု၊ နေအိမ်နှင့် ဝါသနာများ',
        cefrLevel: 'A2',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 8,
        title: 'Health, Medical Care & Emergency Situations',
        titleMyanmar: 'ကျန်းမာရေး၊ ဆေးကုသမှုနှင့် အရေးပေါ်အခြေအနေများ',
        cefrLevel: 'A2-B1',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 9,
        title: 'Workplace, Business, Jobs & Professional Life',
        titleMyanmar: 'လုပ်ငန်းခွင်၊ စီးပွားရေး၊ အလုပ်အကိုင်နှင့် ဆက်သွယ်ရေး',
        cefrLevel: 'B1',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 10,
        title: 'Social Life, Emotions, Opinions & Nuanced Talk',
        titleMyanmar: 'လူမှုဆက်ဆံရေး၊ ခံစားချက်၊ သဘောထားနှင့် နက်နဲသော စကားပြောဆိုမှု',
        cefrLevel: 'B1',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 11,
        title: 'Culture, Traditions, Slang & Media Thai',
        titleMyanmar: 'ထိုင်းယဉ်ကျေးမှု၊ ရိုးရာဓလေ့၊ အပြောစကားနှင့် မီဒီယာသုံးစကား',
        cefrLevel: 'B1-B2',
        unitsCount: 20,
        units: [],
      ),
      const ChapterModel(
        chapterIndex: 12,
        title: 'Advanced Mastery & Formal Proficiency',
        titleMyanmar: 'အဆင့်မြင့် ထိုင်းဘာသာ ကျွမ်းကျင်မှုနှင့် တရားဝင် အသုံးအနှုန်းများ',
        cefrLevel: 'B2',
        unitsCount: 20,
        units: [],
      ),
    ];
  }

  static List<UnitModel> _getChapter1Units() {
    return [
      UnitModel(
        chapterIndex: 1,
        unitIndex: 1,
        title: 'Middle Class Consonants (Part 1)',
        titleMyanmar: 'အလယ်သံဗျည်းများ (အပိုင်း ၁)',
        level: 'A1',
        objective: 'Master 3 middle consonants: ก, จ, ด with their live tones.',
        scriptItems: const [
          ScriptModel(
            symbol: 'ก',
            nameThai: 'ก ไก่',
            nameRoman: 'gor gai',
            nameMyanmar: 'ကော်ကိုင် (ကြက်)',
            category: ScriptCategory.middleConsonant,
            consonantClass: ConsonantClass.middle,
            initialSound: 'g / k',
            finalSound: 'k',
          ),
          ScriptModel(
            symbol: 'จ',
            nameThai: 'จ จาน',
            nameRoman: 'jor jaan',
            nameMyanmar: 'ကျော်ကျာန် (ပန်းကန်)',
            category: ScriptCategory.middleConsonant,
            consonantClass: ConsonantClass.middle,
            initialSound: 'j / ch',
            finalSound: 't',
          ),
          ScriptModel(
            symbol: 'ด',
            nameThai: 'ด เด็ก',
            nameRoman: 'dor dek',
            nameMyanmar: 'ဒေါ်ဒက်ခ် (ကလေး)',
            category: ScriptCategory.middleConsonant,
            consonantClass: ConsonantClass.middle,
            initialSound: 'd',
            finalSound: 't',
          ),
        ],
        vocabulary: const [
          VocabularyModel(
            id: 'v_gai',
            thai: 'ไก่',
            romanization: 'gài',
            myanmarMeaning: 'ကြက်',
            englishMeaning: 'Chicken',
            partOfSpeech: 'noun',
            primaryTone: ThaiTone.low,
            exampleThai: 'กินไก่',
            exampleRomanization: 'gin gài',
            exampleMyanmar: 'ကြက်သားစားသည်',
          ),
          VocabularyModel(
            id: 'v_jaan',
            thai: 'จาน',
            romanization: 'jaan',
            myanmarMeaning: 'ပန်းကန်',
            englishMeaning: 'Plate / Dish',
            partOfSpeech: 'noun',
            primaryTone: ThaiTone.mid,
          ),
          VocabularyModel(
            id: 'v_dek',
            thai: 'เด็ก',
            romanization: 'dèk',
            myanmarMeaning: 'ကလေးငယ်',
            englishMeaning: 'Child',
            partOfSpeech: 'noun',
            primaryTone: ThaiTone.low,
          ),
        ],
        grammar: const [
          GrammarModel(
            id: 'g_mid_tone',
            title: 'Middle Consonant Tone Rules',
            titleMyanmar: 'အလယ်သံဗျည်းများ၏ အသံထွက် ဥပဒေသ',
            pattern: 'Middle Consonant + Long Vowel (Live) = MID TONE',
            explanation: 'When a middle class consonant combines with a long vowel without tone marks, it produces a neutral mid tone.',
            explanationMyanmar: 'အလယ်သံဗျည်းများသည် သရရှည်နှင့် တွဲစပ်ပြီး အသတ်မပါပါက ပင်ကိုယ် မူလအလယ်သံ (Mid Tone) ထွက်ရှိပါသည်။',
            examples: [
              GrammarExample(
                thai: 'กา',
                romanization: 'gaa',
                myanmar: 'ကျီးကန်း',
                english: 'Crow',
              ),
              GrammarExample(
                thai: 'ตา',
                romanization: 'dtaa',
                myanmar: 'မျက်စိ / အဘိုး',
                english: 'Eye / Maternal Grandfather',
              ),
            ],
          ),
        ],
        dialogues: const [
          DialogueModel(
            id: 'd_c1_u1',
            context: 'Identifying items on a table',
            contextMyanmar: 'စားပွဲပေါ်ရှိ ပစ္စည်းများကို ညွှန်ပြမေးမြန်းခြင်း',
            lines: [
              DialogueLine(
                speaker: 'Somchai',
                thai: 'นี่อะไรครับ',
                romanization: 'nîi a-rai khráp',
                myanmar: 'ဒါ ဘာလဲခင်ဗျာ။',
                english: 'What is this?',
              ),
              DialogueLine(
                speaker: 'Malee',
                thai: 'นี่คือจานค่ะ',
                romanization: 'nîi kheu jaan khâ',
                myanmar: 'ဒါ ပန်းကန်ပါရှင်။',
                english: 'This is a plate.',
              ),
            ],
          ),
        ],
        exercises: const [
          FlashcardExercise(
            id: 'ex_c1_u1_1',
            instruction: 'Review Thai Middle Consonants',
            instructionMyanmar: 'အလယ်သံဗျည်းများကို လေ့လာမှတ်သားပါ',
            frontText: 'ก ไก่',
            backText: 'gai (ကြက် - Chicken)',
            romanization: 'gor gai',
          ),
          MultipleChoiceExercise(
            id: 'ex_c1_u1_2',
            instruction: 'Choose the correct Myanmar meaning for ไก่',
            instructionMyanmar: 'ไก่ ၏ အဓိပ္ပာယ်အမှန်ကို ရွေးချယ်ပါ',
            explanation: 'ไก่ means chicken in Thai.',
            question: 'ไก่ (gài)',
            options: ['ကြက် (Chicken)', 'ငါး (Fish)', 'ပန်းကန် (Plate)', 'ကလေး (Child)'],
            correctIndex: 0,
          ),
          MatchingExercise(
            id: 'ex_c1_u1_3',
            instruction: 'Match Thai symbols with their romanized names',
            instructionMyanmar: 'ထိုင်းအက္ခရာနှင့် အသံထွက်ကို တွဲစပ်ပါ',
            pairs: {
              'ก': 'gor gai',
              'จ': 'jor jaan',
              'ด': 'dor dek',
            },
          ),
        ],
      ),
    ];
  }

  static List<UnitModel> _getChapter2Units() {
    return [
      UnitModel(
        chapterIndex: 2,
        unitIndex: 1,
        title: 'Polite Particles & Greetings',
        titleMyanmar: 'ယဉ်ကျေးသော အသုံးအနှုန်းများနှင့် နှုတ်ဆက်ခြင်း',
        level: 'A1',
        objective: 'Learn Sawasdee, Khrap, Kha, and fundamental politeness rules.',
        scriptItems: const [],
        vocabulary: const [
          VocabularyModel(
            id: 'v_sawasdee',
            thai: 'สวัสดี',
            romanization: 'sa-wàt-dii',
            myanmarMeaning: 'မင်္ဂလာပါ',
            englishMeaning: 'Hello / Goodbye',
            partOfSpeech: 'interjection',
            primaryTone: ThaiTone.mid,
          ),
          VocabularyModel(
            id: 'v_khrap',
            thai: 'ครับ',
            romanization: 'khráp',
            myanmarMeaning: 'ခင်ဗျာ (အမျိုးသားသုံး)',
            englishMeaning: 'Polite particle (male)',
            partOfSpeech: 'particle',
            primaryTone: ThaiTone.high,
          ),
          VocabularyModel(
            id: 'v_kha',
            thai: 'ค่ะ',
            romanization: 'khâ',
            myanmarMeaning: 'ရှင် (အမျိုးသမီးသုံး)',
            englishMeaning: 'Polite particle (female)',
            partOfSpeech: 'particle',
            primaryTone: ThaiTone.falling,
          ),
        ],
        grammar: const [
          GrammarModel(
            id: 'g_polite_particles',
            title: 'Gender-based Polite Particles',
            titleMyanmar: 'ကျား/မ ယဉ်ကျေးစကားလုံးများ',
            pattern: '[Statement / Question] + ครับ (Male) / ค่ะ, คะ (Female)',
            explanation: 'Thai sentences typically end with politeness particles to show respect and warmth.',
            explanationMyanmar: 'ထိုင်းစကားတွင် ဝါကျအဆုံးတိုင်း၌ အမျိုးသားများက ครับ (ခရတ်ပ်)၊ အမျိုးသမီးများက ค่ะ/คะ (ခါ့/ခါး) ကို ထည့်သွင်းပြောဆိုရပါမည်။',
            examples: [
              GrammarExample(
                thai: 'สวัสดีครับ',
                romanization: 'sa-wàt-dii khráp',
                myanmar: 'မင်္ဂလာပါခင်ဗျာ',
                english: 'Hello (polite male)',
              ),
              GrammarExample(
                thai: 'สวัสดีค่ะ',
                romanization: 'sa-wàt-dii khâ',
                myanmar: 'မင်္ဂလာပါရှင်',
                english: 'Hello (polite female)',
              ),
            ],
          ),
        ],
        dialogues: const [
          DialogueModel(
            id: 'd_c2_u1',
            context: 'First meeting at a workplace',
            contextMyanmar: 'လုပ်ငန်းခွင်တွင် ပထမဆုံးအကြိမ် တွေ့ဆုံနှုတ်ဆက်ခြင်း',
            lines: [
              DialogueLine(
                speaker: 'Anek',
                thai: 'สวัสดีครับ ผมชื่อเอนกครับ',
                romanization: 'sa-wàt-dii khráp, phǒm chêu a-nèk khráp',
                myanmar: 'မင်္ဂလာပါခင်ဗျာ၊ ကျွန်တော့်နာမည် အာနက်ခ် ပါခင်ဗျာ။',
                english: 'Hello, my name is Anek.',
              ),
              DialogueLine(
                speaker: 'Noi',
                thai: 'สวัสดีค่ะ ดิฉันชื่อน้อยค่ะ',
                romanization: 'sa-wàt-dii khâ, dì-chǎn chêu nói khâ',
                myanmar: 'မင်္ဂလာပါရှင်၊ ကျွန်မနာမည် နွဲ့ ပါရှင်။',
                english: 'Hello, my name is Noi.',
              ),
            ],
          ),
        ],
        exercises: const [
          MultipleChoiceExercise(
            id: 'ex_c2_u1_1',
            instruction: 'What particle do male speakers use for politeness?',
            instructionMyanmar: 'အမျိုးသားများ အသုံးပြုရမည့် ယဉ်ကျေးစကားလုံးကို ရွေးပါ',
            explanation: 'ครับ (khráp) is used by male speakers.',
            question: 'Male Polite Particle',
            options: ['ครับ (khráp)', 'ค่ะ (khâ)', 'นะ (ná)', 'จ้ะ (jâ)'],
            correctIndex: 0,
          ),
          FillInBlankExercise(
            id: 'ex_c2_u1_2',
            instruction: 'Complete the greeting sentence',
            instructionMyanmar: 'ကွက်လပ်ဖြည့်ပါ',
            sentenceWithBlank: 'สวัสดี___ (Female speaker)',
            correctAnswer: 'ค่ะ',
            options: ['ค่ะ', 'ครับ', 'นะ', 'ไหม'],
            translationMyanmar: 'မင်္ဂလာပါရှင် (အမျိုးသမီး)',
          ),
        ],
      ),
    ];
  }
}
