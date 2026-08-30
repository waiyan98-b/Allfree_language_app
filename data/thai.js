(function() {
  const CHAPTER_METADATA = [
    { title: { my: "Chapter 1: အခြေခံနှုတ်ဆက်ခြင်းနှင့် ယဉ်ကျေးစကား (A1)", en: "Chapter 1: Greetings & Politeness (A1)" }, img: "https://images.unsplash.com/photo-1528181304800-259b08848526?w=600" },
    { title: { my: "Chapter 2: ကိုယ့်ကိုယ်ကိုယ် မိတ်ဆက်ခြင်းနှင့် နာမ်စားများ (A1)", en: "Chapter 2: Self-Intro & Pronouns (A1)" }, img: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=600" },
    { title: { my: "Chapter 3: ဂဏန်းများ၊ ဈေးနှုန်းနှင့် အချိန် (A1)", en: "Chapter 3: Numbers, Prices & Time (A1)" }, img: "https://images.unsplash.com/photo-1580519542036-c47de6196ba5?w=600" },
    { title: { my: "Chapter 4: အစားအသောက်နှင့် စားသောက်ဆိုင် (A1)", en: "Chapter 4: Food & Restaurant (A1)" }, img: "https://images.unsplash.com/photo-1559314809-0d155014e29e?w=600" },
    { title: { my: "Chapter 5: ဈေးဝယ်ခြင်းနှင့် အဝတ်အထည် (A2)", en: "Chapter 5: Shopping & Clothes (A2)" }, img: "https://images.unsplash.com/photo-1513151233558-d860c5398176?w=600" },
    { title: { my: "Chapter 6: လမ်းမေးခြင်းနှင့် မြို့တွင်း သွားလာရေး (A2)", en: "Chapter 6: Directions & Transport (A2)" }, img: "https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=600" },
    { title: { my: "Chapter 7: မိသားစု၊ နေအိမ်နှင့် နေ့စဉ်ဘဝ (B1)", en: "Chapter 7: Family, Home & Routine (B1)" }, img: "https://images.unsplash.com/photo-1511895426328-dc8714191300?w=600" },
    { title: { my: "Chapter 8: ရာသီဥတု၊ ခန္ဓာကိုယ်နှင့် ကျန်းမာရေး (B1)", en: "Chapter 8: Weather & Health (B1)" }, img: "https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?w=600" },
    { title: { my: "Chapter 9: ခံစားချက်နှင့် လူမှုဆက်ဆံရေး (B2)", en: "Chapter 9: Feelings & Socializing (B2)" }, img: "https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=600" },
    { title: { my: "Chapter 10: စီးပွားရေးနှင့် ရုံးသုံး ထိုင်းစကား (B2)", en: "Chapter 10: Business & Office Thai (B2)" }, img: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600" },
    { title: { my: "Chapter 11: ယဉ်ကျေးမှု၊ ဥပဒေနှင့် သတင်းမီဒီယာ (C1)", en: "Chapter 11: Culture, Law & Media (C1)" }, img: "https://images.unsplash.com/photo-1541872703-74c5e44368f9?w=600" },
    { title: { my: "Chapter 12: စကားပုံများ၊ ဗန်းစကားနှင့် Native အသုံးများ (C2)", en: "Chapter 12: Idioms, Slang & Native (C2)" }, img: "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=600" }
  ];

  const CORE_VOCAB_BANK = [
    { word: "สวัสดี", roman: "sà-wàt-dii", meaning: { my: "မင်္ဂလာပါ", en: "Hello" } },
    { word: "ขอบคุณ", roman: "khɔ̀ɔp-khun", meaning: { my: "ကျေးဇူးတင်ပါတယ်", en: "Thank you" } },
    { word: "ขอโทษ", roman: "khɔ̌ɔ-thôot", meaning: { my: "တောင်းပန်ပါတယ်", en: "Sorry" } },
    { word: "สบายดี", roman: "sà-baai-dii", meaning: { my: "နေကောင်းပါတယ်", en: "I'm fine" } },
    { word: "ไม่เป็นไร", roman: "mâi-pen-rai", meaning: { my: "ရပါတယ် / ကိစ္စမရှိပါ", en: "No problem" } },
    { word: "อรุณสวัสดิ์", roman: "à-run-sà-wàt", meaning: { my: "မင်္ဂလာနံနက်ခင်းပါ", en: "Good morning" } },
    { word: "ราตรีสวัสดิ์", roman: "raa-trii-sà-wàt", meaning: { my: "ကောင်းသောညပါ", en: "Good night" } },
    { word: "ลาก่อน", roman: "laa-gòn", meaning: { my: "နှုတ်ဆက်ပါတယ်", en: "Goodbye" } },
    { word: "ครับ", roman: "khráp", meaning: { my: "ခင်ဗျာ (ကျား)", en: "Male particle" } },
    { word: "ค่ะ", roman: "khâ", meaning: { my: "ရှင့် (မ)", en: "Female particle" } },
    { word: "กินข้าว", roman: "gin-khâao", meaning: { my: "ထမင်းစားသည်", en: "Eat meal" } },
    { word: "ดื่มน้ำ", roman: "dʉ̀ʉm-nám", meaning: { my: "ရေသောက်သည်", en: "Drink water" } },
    { word: "อร่อย", roman: "à-rɔ̀y", meaning: { my: "အရသာရှိသည်", en: "Delicious" } },
    { word: "เท่าไหร่", roman: "thâo-rài", meaning: { my: "ဘယ်လောက်လဲ", en: "How much" } },
    { word: "ที่ไหน", roman: "thîi-nǎi", meaning: { my: "ဘယ်မှာလဲ", en: "Where" } },
    { word: "ยินดีที่ได้รู้จัก", roman: "yin-dii-thîi-dâi-rúu-jàk", meaning: { my: "တွေ့ရတာ ဝမ်းသာပါတယ်", en: "Nice to meet you" } },
    { word: "ทำงาน", roman: "tham-ngaan", meaning: { my: "အလုပ်လုပ်သည်", en: "Work" } },
    { word: "พักผ่อน", roman: "phák-phɔ̀ɔn", meaning: { my: "အနားယူသည်", en: "Rest" } },
    { word: "ไปเที่ยว", roman: "bpai-thîao", meaning: { my: "ခရီးသွားသည်/လည်ပတ်သည်", en: "Travel" } },
    { word: "เข้าใจ", roman: "khâo-jai", meaning: { my: "နားလည်သည်", en: "Understand" } }
  ];

  const generatedChapters = [];

  for (let c = 1; c <= 12; c++) {
    const meta = CHAPTER_METADATA[c - 1];
    const units = [];

    for (let u = 1; u <= 20; u++) {
      const v1 = CORE_VOCAB_BANK[(u - 1) % CORE_VOCAB_BANK.length];
      const v2 = CORE_VOCAB_BANK[u % CORE_VOCAB_BANK.length];
      const v3 = CORE_VOCAB_BANK[(u + 1) % CORE_VOCAB_BANK.length];
      const v4 = CORE_VOCAB_BANK[(u + 2) % CORE_VOCAB_BANK.length];

      const unitObj = {
        id: `th-c${c}-u${u}`,
        title: {
          my: `Unit ${c}.${u}: လေ့ကျင့်ခန်း အဆင့် ${u}`,
          en: `Unit ${c}.${u}: Mastery Practice ${u}`
        },
        vocabulary: [
          { id: `v-${c}-${u}-1`, word: v1.word, roman: v1.roman, meaning: v1.meaning },
          { id: `v-${c}-${u}-2`, word: v2.word, roman: v2.roman, meaning: v2.meaning }
        ],
        grammar: {
          title: { my: `သဒ္ဒါအသုံးချမှု ${c}.${u}`, en: `Grammar Rule ${c}.${u}` },
          rule: { my: `${v1.word} ကို ဝါကျတွင် ယဉ်ကျေးစွာ ပေါင်းစပ်အသုံးပြုပုံ။`, en: `Natural collocation and usage of '${v1.word}'.` },
          explanation: { my: `အခြေအနေအလိုက် အသံထွက်နှင့် အဓိပ္ပာယ်ကို သတိပြုလေ့လာပါ။`, en: `Focus on tonal accuracy and contextual nuance.` }
        },
        dialogue: {
          title: { my: "အပြန်အလှန် စကားပြောခန်း (Dialogue)", en: "Conversation Drill" },
          lines: [
            { speaker: "A", thai: `${v1.word}ครับ`, roman: `${v1.roman} khráp`, trans: { my: `${v1.meaning.my} ခင်ဗျာ`, en: `${v1.meaning.en} sir` } },
            { speaker: "B", thai: `${v2.word}ค่ะ`, roman: `${v2.roman} khâ`, trans: { my: `${v2.meaning.my} ရှင့်`, en: `${v2.meaning.en} ma'am` } }
          ]
        },
        exercises: [
          {
            type: "matching_pairs",
            prompt: { my: "🔊 အသံလှိုင်းများကို နှိပ်ပြီး ကိုက်ညီသော စာလုံးနှင့် တွဲစပ်ပါ (Tap matching pairs):", en: "🔊 Tap the matching pairs:" },
            pairs: [
              { id: "p1", audio: v1.word, text: { my: v1.word, en: v1.word } },
              { id: "p2", audio: v2.word, text: { my: v2.word, en: v2.word } },
              { id: "p3", audio: v3.word, text: { my: v3.word, en: v3.word } },
              { id: "p4", audio: v4.word, text: { my: v4.word, en: v4.word } }
            ]
          },
          {
            type: "mcq",
            prompt: { my: `"${v1.word}" ၏ အဓိပ္ပာယ်ကို ရွေးပါ:`, en: `Select meaning of "${v1.word}":` },
            promptTargetAudio: v1.word,
            options: { my: [v1.meaning.my, v2.meaning.my, v3.meaning.my], en: [v1.meaning.en, v2.meaning.en, v3.meaning.en] },
            audioTargets: [v1.word, v2.word, v3.word],
            correct: 0,
            explanation: { my: `${v1.word} ဆိုသည်မှာ ${v1.meaning.my} ဖြစ်ပါသည်။`, en: `${v1.word} means ${v1.meaning.en}.` }
          },
          {
            type: "speaking",
            prompt: { my: `🎙️ အသံထွက်ဖတ်ပါ: "${v1.word}"`, en: `🎙️ Speak: "${v1.word}"` },
            targetText: v1.word,
            roman: v1.roman
          },
          {
            type: "listening",
            prompt: { my: "ကြားရသည့် အသံနှင့် ကိုက်ညီသော စာလုံးကို ရွေးပါ:", en: "Listen and choose:" },
            targetText: v2.word,
            options: [v2.word, v1.word, v3.word],
            correct: 0
          },
          {
            type: "speaking",
            prompt: { my: `🎙️ အသံထွက်ဖတ်ပါ: "${v2.word}"`, en: `🎙️ Speak: "${v2.word}"` },
            targetText: v2.word,
            roman: v2.roman
          },
          {
            type: "word_order",
            prompt: { my: `ဝါကျစီပါ: "${v1.word} ${v2.word}"`, en: `Arrange: "${v1.word} ${v2.word}"` },
            words: [v2.word, v1.word],
            correctSequence: [v1.word, v2.word]
          }
        ],
        quiz: [
          {
            type: "mcq",
            prompt: { my: `Final Unit Check: "${v1.word}" ၏ မှန်ကန်သော အသံနှင့် အဓိပ္ပာယ်မှာ?`, en: `Final Unit Check: Correct match for "${v1.word}"?` },
            promptTargetAudio: v1.word,
            options: [v1.word, v2.word, v3.word],
            audioTargets: [v1.word, v2.word, v3.word],
            correct: 0
          }
        ]
      };

      units.push(unitObj);
    }

    generatedChapters.push({
      id: `th-c${c}`,
      title: meta.title,
      coverImage: meta.img,
      units: units
    });
  }

  window.THAI_A1_CHAPTERS = generatedChapters;
})();
