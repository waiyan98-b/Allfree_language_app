import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';
import '../common/audio_play_button.dart';

class ListeningChoiceWidget extends StatefulWidget {
  final ListeningChoiceExercise exercise;
  final Function(bool isCorrect) onComplete;

  const ListeningChoiceWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<ListeningChoiceWidget> createState() => _ListeningChoiceWidgetState();
}

class _ListeningChoiceWidgetState extends State<ListeningChoiceWidget> {
  int? _selectedIndex;
  bool _isAnswered = false;

  void _checkAnswer() {
    if (_selectedIndex == null) return;
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
                  size: 72,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Tap to listen / အသံနားထောင်ရန် နှိပ်ပါ',
                  style: AppTypography.bodySmall
                      .copyWith(color: AppColors.textSecondaryLight),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
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
                    child: Text(
                      option,
                      style: AppTypography.thaiMedium.copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
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
                  onPressed: () {
                    widget.onComplete(
                        _selectedIndex == widget.exercise.correctIndex);
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
