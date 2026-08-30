window.THAI_A1_CHAPTERS = [
  {
    id: "th-c1",
    title: { my: "Chapter 1: အခြေခံနှုတ်ဆက်ခြင်းနှင့် ယဉ်ကျေးစကား (A1)", en: "Chapter 1: Greetings & Politeness (A1)" },
    coverImage: "https://images.unsplash.com/photo-1528181304800-259b08848526?w=600",
    units: [
      {
        id: "th-u1-1",
        title: { my: "Unit 1.1: နေ့စဉ်နှုတ်ဆက်ခြင်း", en: "Unit 1.1: Daily Greetings" },
        vocabulary: [
          { id: "th-v101", word: "สวัสดี", roman: "sà-wàt-dii", meaning: { my: "မင်္ဂလာပါ / နှုတ်ဆက်ပါတယ်", en: "Hello / Greetings" }, example: "สวัสดีครับ" },
          { id: "th-v102", word: "อรุณสวัสดิ์", roman: "à-run-sà-wàt", meaning: { my: "မင်္ဂလာနံနက်ခင်းပါ", en: "Good morning" }, example: "อรุณสวัสดิ์ครับ" }
        ],
        grammar: {
          title: { my: "နှုတ်ဆက်စကား အသုံးပြုပုံ", en: "General Greetings" },
          rule: { my: "สวัสดี (sà-wàt-dii) ကို အချိန်မရွေး နှုတ်ဆက်ရာတွင် သုံးနိုင်ပါသည်။", en: "Use 'สวัสดี' at any time to greet others." },
          explanation: { my: "အချိန်မရွေး နေရာမရွေး သုံးနိုင်သော အခြေခံအကျဆုံး စကားလုံးဖြစ်ပါသည်။", en: "A universal Thai greeting." }
        },
        exercises: [
          {
            type: "mcq",
            prompt: { my: "\"สวัสดี\" ၏ အဓိပ္ပာယ်ကို ရွေးပါ:", en: "Meaning of \"สวัสดี\":" },
            options: { my: ["မင်္ဂလာပါ", "ကျေးဇူးတင်ပါတယ်", "တောင်းပန်ပါတယ်"], en: ["Hello", "Thank you", "Sorry"] },
            correct: 0,
            explanation: { my: "สวัสดี ဆိုသည်မှာ မင်္ဂလာပါ ဖြစ်ပါသည်။", en: "สวัสดี means Hello." }
          },
          {
            type: "listening",
            prompt: { my: "ကြားရသည့် အသံနှင့် ကိုက်ညီသော စာလုံးကို ရွေးပါ:", en: "Select the word you hear:" },
            targetText: "สวัสดี",
            options: ["สวัสดี", "อรุณสวัสดิ์", "ขอบคุณ"],
            correct: 0
          },
          {
            type: "word_order",
            prompt: { my: "ဝါကျစီပါ: \"မင်္ဂလာပါခင်ဗျာ\"", en: "Arrange: \"Hello (Polite Male)\"" },
            words: ["ครับ", "สวัสดี"],
            correctSequence: ["สวัสดี", "ครับ"],
            explanation: { my: "ယဉ်ကျေးစကားလုံးကို ဝါကျအဆုံးတွင် ထားရမည်။", en: "Polite particles go at the end." }
          }
        ],
        quiz: [
          {
            type: "mcq",
            prompt: { my: "မင်္ဂလာနံနက်ခင်းပါ ကို ထိုင်းလို မည်သို့ခေါ်သနည်း?", en: "Good morning in Thai:" },
            options: ["อรุณสวัสดิ์", "ราตรีสวัสดิ์", "สวัสดี"],
            correct: 0
          }
        ]
      },
      {
        id: "th-u1-2",
        title: { my: "Unit 1.2: ယဉ်ကျေးစကားလုံးများ", en: "Unit 1.2: Polite Particles" },
        vocabulary: [
          { id: "th-v103", word: "ครับ", roman: "khráp", meaning: { my: "ခင်ဗျာ (အမျိုးသားသုံး)", en: "Male polite ending" }, example: "ขอบคุณครับ" },
          { id: "th-v104", word: "ค่ะ", roman: "khâ", meaning: { my: "ရှင့် (အမျိုးသမီးသုံး)", en: "Female polite ending" }, example: "ขอบคุณค่ะ" }
        ],
        grammar: {
          title: { my: "ครับ နှင့် ค่ะ", en: "Particles ครับ & ค่ะ" },
          rule: { my: "ဝါကျအဆုံးတွင် ယဉ်ကျေးမှုဖော်ပြရန် မဖြစ်မနေ ထည့်သုံးရပါမည်။", en: "End sentences with polite particles." },
          explanation: { my: "အမျိုးသားက ครับ သုံးပြီး အမျိုးသမီးက ค่ะ သုံးရပါမည်။", en: "Men use ครับ, women use ค่ะ." }
        },
        exercises: [
          {
            type: "mcq",
            prompt: { my: "အမျိုးသမီးများ သုံးရမည့် ယဉ်ကျေးစကားလုံးမှာ?", en: "Female polite particle:" },
            options: ["ค่ะ", "ครับ", "นะ"],
            correct: 0
          },
          {
            type: "listening",
            prompt: { my: "ကြားရသည့် အသံကို ရွေးပါ:", en: "Listen and choose:" },
            targetText: "ขอบคุณครับ",
            options: ["ขอบคุณครับ", "ขอบคุณค่ะ", "ขอโทษครับ"],
            correct: 0
          }
        ],
        quiz: [
          {
            type: "mcq",
            prompt: { my: "အမျိုးသားများ သုံးရမည့် စကားလုံးမှာ?", en: "Male polite particle:" },
            options: ["ครับ", "ค่ะ"],
            correct: 0
          }
        ]
      },
      {
        id: "th-u1-3",
        title: { my: "Unit 1.3: နှုတ်ဆက်ခွဲခွာခြင်း", en: "Unit 1.3: Saying Goodbye" },
        vocabulary: [
          { id: "th-v105", word: "ลาก่อน", roman: "laa-gòn", meaning: { my: "နှုတ်ဆက်ပါတယ် (တာ့တာ)", en: "Goodbye" }, example: "ลาก่อนครับ" },
          { id: "th-v106", word: "แล้วพบกันใหม่", roman: "láew-phóp-gan-mài", meaning: { my: "နောက်မှ ပြန်တွေ့ကြမယ်", en: "See you again" }, example: "แล้วพบกันใหม่ครับ" }
        ],
        grammar: {
          title: { my: "ခွဲခွာစကား", en: "Parting Expressions" },
          rule: { my: "แล้วพบกันใหม่ (See you again) ကို နေ့စဉ်သုံးသည်။", en: "'แล้วพบกันใหม่' means see you again." },
          explanation: { my: "ရင်းနှီးသူအချင်းချင်း บ๊ายบาย (Bye-bye) ဟုလည်း သုံးသည်။", en: "Casual speech uses 'Bye-bye'." }
        },
        exercises: [
          {
            type: "mcq",
            prompt: { my: "\"နောက်မှ ပြန်တွေ့မယ်\" ကို ရွေးပါ:", en: "Choose 'See you again':" },
            options: ["แล้วพบกันใหม่", "สวัสดี", "ขอบคุณ"],
            correct: 0
          },
          {
            type: "listening",
            prompt: { my: "ကြားရသည့် အသံကို ရွေးပါ:", en: "Listen and choose:" },
            targetText: "ลาก่อน",
            options: ["ลาก่อน", "สวัสดี", "ครับ"],
            correct: 0
          }
        ],
        quiz: [
          {
            type: "mcq",
            prompt: { my: "Goodbye in Thai?", en: "Goodbye in Thai?" },
            options: ["ลาก่อน", "อรุณสวัสดิ์"],
            correct: 0
          }
        ]
      }
    ]
  }
];
