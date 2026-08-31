import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/audio_play_button.dart';

class FlashcardExerciseWidget extends StatefulWidget {
  final FlashcardExercise exercise;
  final Function(bool isCorrect) onComplete;

  const FlashcardExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<FlashcardExerciseWidget> createState() =>
      _FlashcardExerciseWidgetState();
}

class _FlashcardExerciseWidgetState extends State<FlashcardExerciseWidget> {
  bool _showBack = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.exercise.instruction,
                style: AppTypography.h3,
              ),
              Text(
                widget.exercise.instructionMyanmar,
                style: AppTypography.myanmarText
                    .copyWith(color: AppColors.textSecondaryLight),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showBack = !_showBack;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _showBack ? AppColors.accent : AppColors.primary,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_showBack) ...[
                      Text(
                        widget.exercise.frontText,
                        style: AppTypography.thaiDisplay.copyWith(fontSize: 42),
                        textAlign: TextAlign.center,
                      ),
                      if (widget.exercise.romanization != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          widget.exercise.romanization!,
                          style: AppTypography.romanization
                              .copyWith(fontSize: 18),
                        ),
                      ],
                      const SizedBox(height: 24),
                      Text(
                        'Tap to flip / လှန်ကြည့်ရန် နှိပ်ပါ',
                        style: AppTypography.bodySmall
                            .copyWith(color: AppColors.textSecondaryLight),
                      ),
                    ] else ...[
                      Text(
                        widget.exercise.backText,
                        style: AppTypography.h1.copyWith(
                          fontSize: 28,
                          color: AppColors.textPrimaryLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (widget.exercise.audioAsset != null) ...[
                        const SizedBox(height: 16),
                        AudioPlayButton(
                          onPlay: () {},
                          size: 48,
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        if (_showBack)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => widget.onComplete(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.errorLight,
                      foregroundColor: AppColors.error,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Still Learning'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => widget.onComplete(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Got it!'),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
