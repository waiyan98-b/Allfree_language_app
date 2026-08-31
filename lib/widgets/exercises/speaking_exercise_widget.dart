import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';
import '../common/audio_play_button.dart';

class SpeakingExerciseWidget extends StatefulWidget {
  final SpeakingExercise exercise;
  final Function(bool isCorrect) onComplete;

  const SpeakingExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<SpeakingExerciseWidget> createState() => _SpeakingExerciseWidgetState();
}

class _SpeakingExerciseWidgetState extends State<SpeakingExerciseWidget> {
  bool _isRecording = false;
  double? _accuracyScore;

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (!_isRecording) {
        _accuracyScore = 0.88;
      }
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
                      widget.exercise.targetThaiText,
                      style: AppTypography.thaiLarge.copyWith(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.exercise.romanization,
                      style: AppTypography.romanization.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.exercise.meaningMyanmar,
                      style: AppTypography.myanmarText
                          .copyWith(color: AppColors.textSecondaryLight),
                    ),
                    const SizedBox(height: 12),
                    AudioPlayButton(onPlay: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        if (_accuracyScore != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Pronunciation Match: ${(_accuracyScore! * 100).toInt()}%',
              style: AppTypography.h3.copyWith(color: AppColors.success),
            ),
          ),
        const Spacer(),
        Center(
          child: InkWell(
            onTap: _toggleRecording,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _isRecording ? AppColors.error : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _isRecording
              ? 'Listening... / ပြောပါ...'
              : 'Tap mic to speak / အသံသွင်းရန် မိုက်ကိုနှိပ်ပါ',
          style: AppTypography.bodySmall,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomButton(
            text: 'Continue',
            onPressed: _accuracyScore != null
                ? () {
                    widget.onComplete(_accuracyScore! >= 0.7);
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
