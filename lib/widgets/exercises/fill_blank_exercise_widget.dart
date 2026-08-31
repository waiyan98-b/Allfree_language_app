import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';

class FillBlankExerciseWidget extends StatefulWidget {
  final FillInBlankExercise exercise;
  final Function(bool isCorrect) onComplete;

  const FillBlankExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<FillBlankExerciseWidget> createState() =>
      _FillBlankExerciseWidgetState();
}

class _FillBlankExerciseWidgetState extends State<FillBlankExerciseWidget> {
  String? _selectedOption;
  bool _isAnswered = false;

  void _checkAnswer() {
    if (_selectedOption == null) return;
    setState(() {
      _isAnswered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displaySentence = widget.exercise.sentenceWithBlank.replaceAll(
      '___',
      _selectedOption ?? ' ______ ',
    );

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
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Column(
                  children: [
                    Text(
                      displaySentence,
                      style: AppTypography.thaiLarge.copyWith(
                        fontSize: 22,
                        color: _isAnswered
                            ? (_selectedOption == widget.exercise.correctAnswer
                                ? AppColors.success
                                : AppColors.error)
                            : AppColors.textPrimaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.exercise.translationMyanmar,
                      style: AppTypography.myanmarText
                          .copyWith(color: AppColors.textSecondaryLight),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: widget.exercise.options.map((option) {
              final isSelected = _selectedOption == option;
              return ActionChip(
                label: Text(
                  option,
                  style: AppTypography.thaiMedium.copyWith(
                    fontSize: 18,
                    color: isSelected ? Colors.white : AppColors.textPrimaryLight,
                  ),
                ),
                backgroundColor:
                    isSelected ? AppColors.primary : Colors.grey.shade100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                onPressed: _isAnswered
                    ? null
                    : () {
                        setState(() {
                          _selectedOption = option;
                        });
                      },
              );
            }).toList(),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: _isAnswered
              ? CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    widget.onComplete(
                        _selectedOption == widget.exercise.correctAnswer);
                  },
                )
              : CustomButton(
                  text: 'Check Answer',
                  onPressed: _selectedOption != null ? _checkAnswer : null,
                ),
        ),
      ],
    );
  }
}
