import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../models/vocabulary_model.dart';
import '../../../widgets/common/tone_badge.dart';
import '../../../widgets/common/audio_play_button.dart';

class VocabSection extends StatelessWidget {
  final List<VocabularyModel> vocabulary;

  const VocabSection({
    super.key,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    if (vocabulary.isEmpty) {
      return const Center(child: Text('No vocabulary items for this section.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: vocabulary.length,
      itemBuilder: (context, index) {
        final item = vocabulary[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.borderLight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Word, Tone Badge & Audio Button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.thai,
                            style: AppTypography.thaiLarge.copyWith(fontSize: 28),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.romanization,
                            style: AppTypography.romanization.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ToneBadge(tone: item.primaryTone),
                        const SizedBox(height: 8),
                        AudioPlayButton(
                          onPlay: () {},
                          size: 38,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),

                // Meaning Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withAlpha(50),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.partOfSpeech.toUpperCase(),
                        style: AppTypography.toneLabel.copyWith(
                          color: AppColors.primaryDark,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.myanmarMeaning,
                            style: AppTypography.myanmarText.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            item.englishMeaning,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Syllable Breakdown (if available)
                if (item.syllables.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: item.syllables.map((s) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          '${s.syllable} (${ToneBadge.getToneName(s.tone)})',
                          style: AppTypography.bodySmall.copyWith(fontSize: 11),
                        ),
                      );
                    }).toList(),
                  ),
                ],

                // Example Sentence (if available)
                if (item.exampleThai != null && item.exampleThai!.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.exampleThai!,
                          style: AppTypography.thaiMedium.copyWith(fontSize: 15),
                        ),
                        if (item.exampleRomanization != null)
                          Text(
                            item.exampleRomanization!,
                            style: AppTypography.romanization.copyWith(fontSize: 13),
                          ),
                        if (item.exampleMyanmar != null)
                          Text(
                            item.exampleMyanmar!,
                            style: AppTypography.myanmarText.copyWith(
                              fontSize: 13,
                              color: AppColors.textSecondaryLight,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
