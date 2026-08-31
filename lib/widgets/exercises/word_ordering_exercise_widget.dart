import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';

class WordOrderingExerciseWidget extends StatefulWidget {
  final WordOrderingExercise exercise;
  final Function(bool isCorrect) onComplete;

  const WordOrderingExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<WordOrderingExerciseWidget> createState() =>
      _WordOrderingExerciseWidgetState();
}

class _WordOrderingExerciseWidgetState
    extends State<WordOrderingExerciseWidget> {
  late List<String> _bankWords;
  final List<String> _assembledWords = [];
  bool _isAnswered = false;

  @override
  void initState() {
    super.initState();
    _bankWords = List.from(widget.exercise.shuffledWords);
  }

  void _moveToAssembled(int index) {
    if (_isAnswered) return;
    setState(() {
      final word = _bankWords.removeAt(index);
      _assembledWords.add(word);
    });
  }

  void _moveToBank(int index) {
    if (_isAnswered) return;
    setState(() {
      final word = _assembledWords.removeAt(index);
      _bankWords.add(word);
    });
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
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Text(
                  widget.exercise.targetTranslation,
                  style: AppTypography.myanmarText
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Assembled slots area
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minHeight: 110),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _assembledWords.asMap().entries.map((entry) {
              final idx = entry.key;
              final word = entry.value;

              return ActionChip(
                label: Text(word, style: AppTypography.thaiMedium),
                backgroundColor: AppColors.primaryLight.withAlpha(80),
                onPressed: () => _moveToBank(idx),
              );
            }).toList(),
          ),
        ),
        const Spacer(),
        // Word Bank area
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _bankWords.asMap().entries.map((entry) {
              final idx = entry.key;
              final word = entry.value;

              return ActionChip(
                label: Text(word, style: AppTypography.thaiMedium),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.borderLight),
                ),
                onPressed: () => _moveToAssembled(idx),
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
                    final isCorrect = _assembledWords.join('') ==
                        widget.exercise.correctOrder.join('');
                    widget.onComplete(isCorrect);
                  },
                )
              : CustomButton(
                  text: 'Check Sentence',
                  onPressed: _bankWords.isEmpty ? _checkAnswer : null,
                ),
        ),
      ],
    );
  }
}
