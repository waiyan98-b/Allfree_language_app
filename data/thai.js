window.THAI_A1_CHAPTERS = [
  {
    id: "th-c1",
    title: { my: "Chapter 1: အခြေခံနှုတ်ဆက်ခြင်းနှင့် ယဉ်ကျေးစကား", en: "Chapter 1: Greetings & Politeness" },
    coverImage: "https://images.unsplash.com/photo-1528181304800-259b08848526?w=600",
    units: [
      {
        id: "th-u1-1",
        title: { my: "Unit 1.1: နေ့စဉ်နှုတ်ဆက်ခြင်းနှင့် မိတ်ဆက်စကား", en: "Unit 1.1: Daily Greetings & Conversation" },
        vocabulary: [
          { id: "th-v101", word: "สวัสดี", roman: "sà-wàt-dii", meaning: { my: "မင်္ဂလာပါ", en: "Hello" }, example: "สวัสดีครับ" },
          { id: "th-v102", word: "อรุณสวัสดิ์", roman: "à-run-sà-wàt", meaning: { my: "မင်္ဂလာနံနက်ခင်းပါ", en: "Good morning" }, example: "อรุณสวัสดิ์ครับ" },
          { id: "th-v103", word: "ครับ", roman: "khráp", meaning: { my: "ခင်ဗျာ (ကျား)", en: "Polite male" }, example: "ครับ" },
          { id: "th-v104", word: "ค่ะ", roman: "khâ", meaning: { my: "ရှင့် (မ)", en: "Polite female" }, example: "ค่ะ" }
        ],
        grammar: {
          title: { my: "နှုတ်ဆက်စကားနှင့် ယဉ်ကျေးမှု", en: "Greetings & Politeness" },
          rule: { my: "สวัสดี + ครับ/ค่ะ (အချိန်မရွေး နှုတ်ဆက်နိုင်သည်)", en: "Combine สวัสดี with polite particles." },
          explanation: { my: "အမျိုးသားက ครับ သုံးပြီး၊ အမျိုးသမီးက ค่ะ သုံးရပါမည်။", en: "Men say ครับ, women say ค่ะ." }
        },
        dialogue: {
          title: { my: "အပြန်အလှန် စကားပြောခန်း (Dialogue Practice)", en: "Conversation Drill" },
          lines: [
            { speaker: "Somchai (ကျား)", thai: "สวัสดีครับ", roman: "sà-wàt-dii khráp", trans: { my: "မင်္ဂလာပါခင်ဗျာ", en: "Hello sir" } },
            { speaker: "Lin (မ)", thai: "สวัสดีค่ะ สบายดีไหมคะ", roman: "sà-wàt-dii khâ, sà-baai-dii mǎi khá", trans: { my: "မင်္ဂလာပါရှင့်၊ နေကောင်းလားရှင့်", en: "Hello, how are you?" } },
            { speaker: "Somchai (ကျား)", thai: "สบายดีครับ ขอบคุณครับ", roman: "sà-baai-dii khráp, khɔ̀ɔp-khun khráp", trans: { my: "နေကောင်းပါတယ်ခင်ဗျာ၊ ကျေးဇူးတင်ပါတယ်", en: "I'm fine, thank you" } }
          ]
        },
        exercises: [
          {
            type: "mcq",
            prompt: { my: "\"สวัสดี\" ၏ အဓိပ္ပာယ်ကို ရွေးပါ:", en: "Meaning of \"สวัสดี\":" },
            options: { my: ["မင်္ဂလာပါ", "ကျေးဇူးတင်ပါတယ်", "တောင်းပန်ပါတယ်"], en: ["Hello", "Thank you", "Sorry"] },
            audioTargets: ["สวัสดี", "ขอบคุณ", "ขอโทษ"],
            correct: 0,
            explanation: { my: "สวัสดี ဆိုသည်မှာ မင်္ဂလာပါ ဖြစ်ပါသည်။", en: "สวัสดี means Hello." }
          },
          {
            type: "listening",
            prompt: { my: "ကြားရသည့် အသံနှင့် ကိုက်ညီသော စာလုံးကို ရွေးပါ:", en: "Listen and choose:" },
            targetText: "สวัสดี",
            options: ["สวัสดี", "อรุณสวัสดิ်", "ขอบคุณ"],
            correct: 0
          },
          {
            type: "word_order",
            prompt: { my: "ဝါကျစီပါ: \"မင်္ဂလာပါခင်ဗျာ\"", en: "Arrange: \"Hello (Polite Male)\"" },
            words: ["ครับ", "สวัสดี"],
            correctSequence: ["สวัสดี", "ครับ"],
            explanation: { my: "ယဉ်ကျေးစကားလုံးကို ဝါကျအဆုံးတွင် ထားရမည်။", en: "Polite particle at the end." }
          },
          {
            type: "mcq",
            prompt: { my: "အမျိုးသမီးများ သုံးရမည့် ယဉ်ကျေးစကားလုံးမှာ?", en: "Female polite ending:" },
            options: { my: ["ค่ะ", "ครับ", "นะ"], en: ["ค่ะ", "ครับ", "นะ"] },
            audioTargets: ["ค่ะ", "ครับ", "นะ"],
            correct: 0
          },
          {
            type: "listening",
            prompt: { my: "ကြားရသည့် အသံကို ရွေးပါ:", en: "Listen and choose:" },
            targetText: "อรุณสวัสดิ์",
            options: ["อรุณสวัสดิ์", "ราตรีสวัสดิ์", "สวัสดี"],
            correct: 0
          },
          {
            type: "mcq",
            prompt: { my: "\"Good morning\" ၏ ထိုင်းဘာသာစကားမှာ?", en: "Good morning in Thai:" },
            options: { my: ["မင်္ဂလာနံနက်ခင်းပါ (อรุณสวัสดิ์)", "မင်္ဂလာပါ (สวัสดี)"], en: ["Good morning (อรุณสวัสดิ์)", "Hello (สวัสดี)"] },
            audioTargets: ["อรุณสวัสดิ์", "สวัสดี"],
            correct: 0
          },
          {
            type: "word_order",
            prompt: { my: "ဝါကျစီပါ: \"မင်္ဂလာနံနက်ခင်းပါရှင့်\"", en: "Arrange: \"Good morning (Female)\"" },
            words: ["ค่ะ", "อรุณสวัสดิ์"],
            correctSequence: ["อรุณสวัสดิ์", "ค่ะ"]
          },
          {
            type: "listening",
            prompt: { my: "အမျိုးသားသုံး ယဉ်ကျေးစကားလုံး အသံကို ရွေးပါ:", en: "Select male particle sound:" },
            targetText: "ครับ",
            options: ["ครับ", "ค่ะ", "ไม่"],
            correct: 0
          },
          {
            type: "mcq",
            prompt: { my: "\"ขอบคุณ\" ၏ အဓိပ္ပာယ်မှာ?", en: "Meaning of \"ขอบคุณ\":" },
            options: { my: ["ကျေးဇူးတင်ပါတယ်", "တောင်းပန်ပါတယ်", "နှုတ်ဆက်ပါတယ်"], en: ["Thank you", "Sorry", "Goodbye"] },
            audioTargets: ["ขอบคุณ", "ขอโทษ", "ลาก่อน"],
            correct: 0
          },
          {
            type: "word_order",
            prompt: { my: "ဝါကျစီပါ: \"ကျေးဇူးတင်ပါတယ်ခင်ဗျာ\"", en: "Arrange: \"Thank you (Male)\"" },
            words: ["ครับ", "ขอบคุณ"],
            correctSequence: ["ขอบคุณ", "ครับ"]
          }
        ],
        quiz: [
          {
            type: "mcq",
            prompt: { my: "Final Quiz: မင်္ဂလာပါခင်ဗျာ ဟု နှုတ်ဆက်ရာတွင် မှန်ကန်သော အသုံးမှာ?", en: "Final Quiz: Correct Hello (Male):" },
            options: ["สวัสดีครับ", "สวัสดีค่ะ", "อรุณสวัสดิ์ค่ะ"],
            audioTargets: ["สวัสดีครับ", "สวัสดีค่ะ", "อรุณสวัสดิ์ค่ะ"],
            correct: 0
          }
        ]
      }
    ]
  }
];
