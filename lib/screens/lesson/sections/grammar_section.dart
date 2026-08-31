import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../models/grammar_model.dart';
import '../../../widgets/common/audio_play_button.dart';

class GrammarSection extends StatelessWidget {
  final List<GrammarModel> grammar;

  const GrammarSection({
    super.key,
    required this.grammar,
  });

  @override
  Widget build(BuildContext context) {
    if (grammar.isEmpty) {
      return const Center(child: Text('No grammar items for this section.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: grammar.length,
      itemBuilder: (context, index) {
        final item = grammar[index];

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
                // Title
                Text(item.title, style: AppTypography.h3),
                const SizedBox(height: 2),
                Text(
                  item.titleMyanmar,
                  style: AppTypography.myanmarText.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                // Pattern Block
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withAlpha(40),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primary.withAlpha(80)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.schema_rounded, color: AppColors.primary, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.pattern,
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Explanation
                Text(
                  item.explanation,
                  style: AppTypography.bodyMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  item.explanationMyanmar,
                  style: AppTypography.myanmarText.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 16),

                // Examples List
                Text(
                  'Examples / ဥပမာများ',
                  style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...item.examples.map((example) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                example.thai,
                                style: AppTypography.thaiMedium.copyWith(fontSize: 16),
                              ),
                              Text(
                                example.romanization,
                                style: AppTypography.romanization.copyWith(fontSize: 13),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                example.myanmar,
                                style: AppTypography.myanmarText.copyWith(fontSize: 13),
                              ),
                              Text(
                                example.english,
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.textSecondaryLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AudioPlayButton(
                          onPlay: () {},
                          size: 34,
                        ),
                      ],
                    ),
                  );
                }),

                // Cultural Note (if present)
                if (item.culturalNote != null && item.culturalNote!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.accentLight.withAlpha(60),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.accent.withAlpha(80)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb_outline_rounded,
                            color: AppColors.accentDark, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item.culturalNote!,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textPrimaryLight,
                            ),
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
