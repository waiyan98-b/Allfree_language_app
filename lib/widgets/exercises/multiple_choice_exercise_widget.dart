import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';
import '../common/audio_play_button.dart';

class MultipleChoiceExerciseWidget extends StatefulWidget {
  final MultipleChoiceExercise exercise;
  final Function(bool isCorrect) onComplete;

  const MultipleChoiceExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<MultipleChoiceExerciseWidget> createState() =>
      _MultipleChoiceExerciseWidgetState();
}

class _MultipleChoiceExerciseWidgetState
    extends State<MultipleChoiceExerciseWidget> {
  int? _selectedIndex;
  bool _isAnswered = false;

  void _checkAnswer() {
    if (_selectedIndex == null || _isAnswered) return;
    setState(() {
      _isAnswered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.exercise.instruction, style: AppTypography.h3),
              Text(
                widget.exercise.instructionMyanmar,
                style: AppTypography.myanmarText
                    .copyWith(color: AppColors.textSecondaryLight),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Column(
                  children: [
                    Text(
                      widget.exercise.question,
                      style: AppTypography.thaiLarge.copyWith(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    if (widget.exercise.questionAudio != null) ...[
                      const SizedBox(height: 12),
                      AudioPlayButton(
                        onPlay: () {},
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: widget.exercise.options.length,
            itemBuilder: (context, index) {
              final option = widget.exercise.options[index];
              final isSelected = _selectedIndex == index;

              Color borderCol = AppColors.borderLight;
              Color bgCol = Colors.white;

              if (_isAnswered) {
                if (index == widget.exercise.correctIndex) {
                  borderCol = AppColors.success;
                  bgCol = AppColors.successLight;
                } else if (isSelected) {
                  borderCol = AppColors.error;
                  bgCol = AppColors.errorLight;
                }
              } else if (isSelected) {
                borderCol = AppColors.primary;
                bgCol = AppColors.primaryLight.withAlpha(50);
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: InkWell(
                  onTap: _isAnswered
                      ? null
                      : () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgCol,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderCol, width: 1.5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: borderCol),
                          ),
                          child: Text(
                            String.fromCharCode(65 + index),
                            style: AppTypography.bodySmall
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            option,
                            style: AppTypography.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: _isAnswered
              ? CustomButton(
                  text: 'Continue',
                  variant: ButtonVariant.primary,
                  onPressed: () {
                    final correct =
                        _selectedIndex == widget.exercise.correctIndex;
                    widget.onComplete(correct);
                  },
                )
              : CustomButton(
                  text: 'Check Answer',
                  onPressed: _selectedIndex != null ? _checkAnswer : null,
                ),
        ),
      ],
    );
  }
}
