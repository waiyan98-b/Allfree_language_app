import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';
import '../common/audio_play_button.dart';

class DictationExerciseWidget extends StatefulWidget {
  final DictationExercise exercise;
  final Function(bool isCorrect) onComplete;

  const DictationExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<DictationExerciseWidget> createState() =>
      _DictationExerciseWidgetState();
}

class _DictationExerciseWidgetState extends State<DictationExerciseWidget> {
  final TextEditingController _ctrl = TextEditingController();
  bool _isAnswered = false;

  @override
  void dispose() {
    _ctrl.dispose();
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
              const SizedBox(height: 24),
              Center(
                child: AudioPlayButton(
                  onPlay: () {},
                  size: 64,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Hint (Romanization): ${widget.exercise.romanizationHint}',
                  style: AppTypography.romanization,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _ctrl,
            enabled: !_isAnswered,
            style: AppTypography.thaiLarge,
            decoration: InputDecoration(
              hintText: 'Type Thai script here...',
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
            child: Text(
              'Correct Thai: ${widget.exercise.correctThaiText}',
              style: AppTypography.thaiMedium.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
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
                    final isCorrect = _ctrl.text.trim() ==
                        widget.exercise.correctThaiText.trim();
                    widget.onComplete(isCorrect);
                  },
                )
              : CustomButton(
                  text: 'Check Spelling',
                  onPressed: _ctrl.text.isNotEmpty ? _checkAnswer : null,
                ),
        ),
      ],
    );
  }
}
