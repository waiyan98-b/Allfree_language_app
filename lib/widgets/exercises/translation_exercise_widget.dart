import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';

class TranslationExerciseWidget extends StatefulWidget {
  final TranslationExercise exercise;
  final Function(bool isCorrect) onComplete;

  const TranslationExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<TranslationExerciseWidget> createState() =>
      _TranslationExerciseWidgetState();
}

class _TranslationExerciseWidgetState
    extends State<TranslationExerciseWidget> {
  final TextEditingController _textCtrl = TextEditingController();
  bool _isAnswered = false;

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  void _checkAnswer() {
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
                child: Text(
                  widget.exercise.sourceText,
                  style: widget.exercise.isThaiToTarget
                      ? AppTypography.thaiLarge
                      : AppTypography.myanmarText.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _textCtrl,
            enabled: !_isAnswered,
            decoration: InputDecoration(
              hintText: 'Type translation here...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        if (_isAnswered)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withAlpha(40),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Expected: ${widget.exercise.expectedTranslation}',
                style: AppTypography.bodyMedium
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: _isAnswered
              ? CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    final input = _textCtrl.text.trim().toLowerCase();
                    final expected =
                        widget.exercise.expectedTranslation.trim().toLowerCase();
                    final isCorrect = input == expected ||
                        widget.exercise.acceptableAlternatives
                            .map((e) => e.trim().toLowerCase())
                            .contains(input);
                    widget.onComplete(isCorrect);
                  },
                )
              : CustomButton(
                  text: 'Submit Translation',
                  onPressed: _textCtrl.text.isNotEmpty ? _checkAnswer : null,
                ),
        ),
      ],
    );
  }
}
