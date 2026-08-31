import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/vocabulary_model.dart';

class ConsonantItem {
  final String symbol;
  final String thaiName;
  final String roman;
  final String myanmar;
  final ConsonantClass cClass;

  const ConsonantItem(
      this.symbol, this.thaiName, this.roman, this.myanmar, this.cClass);
}

class ConsonantMatrixView extends StatefulWidget {
  const ConsonantMatrixView({super.key});

  @override
  State<ConsonantMatrixView> createState() => _ConsonantMatrixViewState();
}

class _ConsonantMatrixViewState extends State<ConsonantMatrixView> {
  ConsonantClass _selectedFilter = ConsonantClass.none;

  static const List<ConsonantItem> allConsonants = [
    // Middle Class (9)
    ConsonantItem('ก', 'ไก่', 'gai', 'ကြက်', ConsonantClass.middle),
    ConsonantItem('จ', 'จาน', 'jaan', 'ပန်းကန်', ConsonantClass.middle),
    ConsonantItem('ด', 'เด็ก', 'dek', 'ကလေး', ConsonantClass.middle),
    ConsonantItem('ต', 'เต่า', 'dtao', 'လိပ်', ConsonantClass.middle),
    ConsonantItem('บ', 'ใบไม้', 'bai-maai', 'သစ်ရွက်', ConsonantClass.middle),
    ConsonantItem('ป', 'ปลา', 'bplaa', 'ငါး', ConsonantClass.middle),
    ConsonantItem('อ', 'อ่าง', 'aang', 'ရေဇလုံ', ConsonantClass.middle),
    ConsonantItem('ฎ', 'ชฎา', 'cha-daa', 'သရဖူ', ConsonantClass.middle),
    ConsonantItem('ฏ', 'ปฏัก', 'bpa-dtak', 'လှံချွန်', ConsonantClass.middle),

    // High Class (11)
    ConsonantItem('ข', 'ไข่', 'khai', 'ကြက်ဥ', ConsonantClass.high),
    ConsonantItem('ฃ', 'ขวด', 'khuat', 'ပုလင်း', ConsonantClass.high),
    ConsonantItem('ฉ', 'ฉิ่ง', 'ching', 'လင်းကွင်း', ConsonantClass.high),
    ConsonantItem('ฐ', 'ฐาน', 'thaan', 'ပလ္လင်ခြေ', ConsonantClass.high),
    ConsonantItem('ถ', 'ถุง', 'thung', 'အိတ်', ConsonantClass.high),
    ConsonantItem('ผ', 'ผึ้ง', 'pheung', 'ပျား', ConsonantClass.high),
    ConsonantItem('ฝ', 'ฝา', 'faa', 'အဖုံး', ConsonantClass.high),
    ConsonantItem('ศ', 'ศาလာ', 'saa-laa', 'ဇရပ်', ConsonantClass.high),
    ConsonantItem('ษ', 'ฤๅษี', 'reu-see', 'ရသေ့', ConsonantClass.high),
    ConsonantItem('ส', 'เสือ', 'seua', 'ကျား', ConsonantClass.high),
    ConsonantItem('ห', 'หีบ', 'heep', 'သေတ္တာ', ConsonantClass.high),

    // Low Class (24)
    ConsonantItem('ค', 'ควาย', 'khwaai', 'ကျွဲ', ConsonantClass.low),
    ConsonantItem('ฅ', 'คน', 'khon', 'လူ', ConsonantClass.low),
    ConsonantItem('ฆ', 'ระฆัง', 'ra-khang', 'ခေါင်းလောင်း', ConsonantClass.low),
    ConsonantItem('ง', 'งู', 'nguu', 'မြွေ', ConsonantClass.low),
    ConsonantItem('ช', 'ช้าง', 'chaang', 'ဆင်', ConsonantClass.low),
    ConsonantItem('ซ', 'โซ่', 'soo', 'သံကြိုး', ConsonantClass.low),
    ConsonantItem('ฌ', 'เฌอ', 'chəə', 'သစ်ပင်', ConsonantClass.low),
    ConsonantItem('ญ', 'หญิง', 'ying', 'အမျိုးသမီး', ConsonantClass.low),
    ConsonantItem('ฑ', 'มณโฑ', 'mon-thoo', 'မန္ဒောဒရီ', ConsonantClass.low),
    ConsonantItem('ฒ', 'ผู้เฒ่า', 'phuu-thao', 'အဘိုးအို', ConsonantClass.low),
    ConsonantItem('ณ', 'เณร', 'neen', 'ကိုရင်', ConsonantClass.low),
    ConsonantItem('ท', 'ทหาร', 'tha-haan', 'စစ်သား', ConsonantClass.low),
    ConsonantItem('ธ', 'ธง', 'thong', 'အလံ', ConsonantClass.low),
    ConsonantItem('น', 'หนู', 'nuu', 'ကြွက်', ConsonantClass.low),
    ConsonantItem('พ', 'พาน', 'phaan', 'ကလပ်ခွက်', ConsonantClass.low),
    ConsonantItem('ฟ', 'ฟัน', 'fan', 'သွား', ConsonantClass.low),
    ConsonantItem('ภ', 'สำเภา', 'sam-phao', 'ရွက်လှေ', ConsonantClass.low),
    ConsonantItem('ม', 'ม้า', 'maa', 'မြင်း', ConsonantClass.low),
    ConsonantItem('ย', 'ยักษ์', 'yak', 'ဘီလူး', ConsonantClass.low),
    ConsonantItem('ร', 'เรือ', 'reua', 'လှေ', ConsonantClass.low),
    ConsonantItem('ล', 'ลิง', 'ling', 'မျောက်', ConsonantClass.low),
    ConsonantItem('ว', 'แหวน', 'waaen', 'လက်စွပ်', ConsonantClass.low),
    ConsonantItem('ฬ', 'จุฬา', 'ju-laa', 'စွန်', ConsonantClass.low),
    ConsonantItem('ฮ', 'นกฮูก', 'nok-huuk', 'ဇီးကွက်', ConsonantClass.low),
  ];

  Color _getColor(ConsonantClass cClass) {
    switch (cClass) {
      case ConsonantClass.middle:
        return AppColors.toneMid;
      case ConsonantClass.high:
        return AppColors.toneFalling;
      case ConsonantClass.low:
        return AppColors.toneLow;
      case ConsonantClass.none:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedFilter == ConsonantClass.none
        ? allConsonants
        : allConsonants.where((c) => c.cClass == _selectedFilter).toList();

    return Column(
      children: [
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              FilterChip(
                label: const Text('All (၄၄ လုံး)'),
                selected: _selectedFilter == ConsonantClass.none,
                onSelected: (_) =>
                    setState(() => _selectedFilter = ConsonantClass.none),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Middle (၉ လုံး)'),
                selected: _selectedFilter == ConsonantClass.middle,
                selectedColor: AppColors.toneMid.withAlpha(50),
                onSelected: (_) =>
                    setState(() => _selectedFilter = ConsonantClass.middle),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('High (၁၁ လုံး)'),
                selected: _selectedFilter == ConsonantClass.high,
                selectedColor: AppColors.toneFalling.withAlpha(50),
                onSelected: (_) =>
                    setState(() => _selectedFilter = ConsonantClass.high),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Low (၂၄ လုံး)'),
                selected: _selectedFilter == ConsonantClass.low,
                selectedColor: AppColors.toneLow.withAlpha(50),
                onSelected: (_) =>
                    setState(() => _selectedFilter = ConsonantClass.low),
              ),
            ],
          ),
        ),
        // Grid View
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final item = filtered[index];
              final color = _getColor(item.cClass);

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color.withAlpha(80), width: 1.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.symbol,
                      style: AppTypography.thaiDisplay.copyWith(
                        fontSize: 30,
                        color: color,
                      ),
                    ),
                    Text(
                      '${item.symbol} ${item.thaiName}',
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${item.roman} (${item.myanmar})',
                      style: AppTypography.bodySmall.copyWith(
                        fontSize: 10,
                        color: AppColors.textSecondaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
