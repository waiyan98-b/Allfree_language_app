import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../models/dialogue_model.dart';
import '../../../widgets/common/audio_play_button.dart';

class DialogueSection extends StatelessWidget {
  final List<DialogueModel> dialogues;

  const DialogueSection({
    super.key,
    required this.dialogues,
  });

  @override
  Widget build(BuildContext context) {
    if (dialogues.isEmpty) {
      return const Center(child: Text('No dialogue items for this section.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dialogues.length,
      itemBuilder: (context, index) {
        final dialogue = dialogues[index];

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
                // Context Header
                Row(
                  children: [
                    const Icon(Icons.forum_rounded, color: AppColors.primary, size: 22),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dialogue.context,
                            style: AppTypography.h3.copyWith(fontSize: 16),
                          ),
                          Text(
                            dialogue.contextMyanmar,
                            style: AppTypography.myanmarText.copyWith(
                              color: AppColors.textSecondaryLight,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 16),

                // Multi-Turn Speech Bubbles
                ...dialogue.lines.asMap().entries.map((entry) {
                  final line = entry.value;
                  final isEven = entry.key % 2 == 0;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                          isEven ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [
                        if (isEven) ...[
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.primaryLight,
                            child: Text(
                              line.speaker.isNotEmpty ? line.speaker[0] : 'A',
                              style: const TextStyle(
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: isEven
                                  ? Colors.white
                                  : AppColors.primaryLight.withAlpha(40),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isEven
                                    ? AppColors.borderLight
                                    : AppColors.primary.withAlpha(80),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  line.speaker,
                                  style: AppTypography.toneLabel.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  line.thai,
                                  style: AppTypography.thaiMedium.copyWith(fontSize: 17),
                                ),
                                Text(
                                  line.romanization,
                                  style: AppTypography.romanization.copyWith(fontSize: 13),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  line.myanmar,
                                  style: AppTypography.myanmarText.copyWith(
                                    fontSize: 13,
                                    color: AppColors.textSecondaryLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (!isEven) ...[
                          const SizedBox(width: 10),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.accentLight,
                            child: Text(
                              line.speaker.isNotEmpty ? line.speaker[0] : 'B',
                              style: const TextStyle(
                                  color: AppColors.accentDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        const SizedBox(width: 6),
                        AudioPlayButton(
                          onPlay: () {},
                          size: 32,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
