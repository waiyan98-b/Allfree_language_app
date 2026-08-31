import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';

class MatchingExerciseWidget extends StatefulWidget {
  final MatchingExercise exercise;
  final Function(bool isCorrect) onComplete;

  const MatchingExerciseWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<MatchingExerciseWidget> createState() => _MatchingExerciseWidgetState();
}

class _MatchingExerciseWidgetState extends State<MatchingExerciseWidget> {
  late List<String> _leftItems;
  late List<String> _rightItems;

  String? _selectedLeft;
  String? _selectedRight;

  final Map<String, String> _matchedPairs = {};
  int _mistakes = 0;

  @override
  void initState() {
    super.initState();
    _leftItems = widget.exercise.pairs.keys.toList()..shuffle();
    _rightItems = widget.exercise.pairs.values.toList()..shuffle();
  }

  void _handleLeftTap(String item) {
    if (_matchedPairs.containsKey(item)) return;
    setState(() {
      _selectedLeft = item;
      _evaluatePair();
    });
  }

  void _handleRightTap(String item) {
    if (_matchedPairs.containsValue(item)) return;
    setState(() {
      _selectedRight = item;
      _evaluatePair();
    });
  }

  void _evaluatePair() {
    if (_selectedLeft != null && _selectedRight != null) {
      if (widget.exercise.pairs[_selectedLeft] == _selectedRight) {
        _matchedPairs[_selectedLeft!] = _selectedRight!;
      } else {
        _mistakes += 1;
      }
      _selectedLeft = null;
      _selectedRight = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDone = _matchedPairs.length == widget.exercise.pairs.length;

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
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              // Left Column
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _leftItems.length,
                  itemBuilder: (context, index) {
                    final item = _leftItems[index];
                    final isMatched = _matchedPairs.containsKey(item);
                    final isSelected = _selectedLeft == item;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: InkWell(
                        onTap: () => _handleLeftTap(item),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: isMatched
                                ? AppColors.successLight
                                : isSelected
                                    ? AppColors.primaryLight.withAlpha(60)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isMatched
                                  ? AppColors.success
                                  : isSelected
                                      ? AppColors.primary
                                      : AppColors.borderLight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            item,
                            style: AppTypography.thaiLarge.copyWith(
                              fontSize: 20,
                              color: isMatched
                                  ? AppColors.success
                                  : AppColors.textPrimaryLight,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Right Column
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _rightItems.length,
                  itemBuilder: (context, index) {
                    final item = _rightItems[index];
                    final isMatched = _matchedPairs.containsValue(item);
                    final isSelected = _selectedRight == item;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: InkWell(
                        onTap: () => _handleRightTap(item),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: isMatched
                                ? AppColors.successLight
                                : isSelected
                                    ? AppColors.primaryLight.withAlpha(60)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isMatched
                                  ? AppColors.success
                                  : isSelected
                                      ? AppColors.primary
                                      : AppColors.borderLight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            item,
                            style: AppTypography.bodyMedium.copyWith(
                              color: isMatched
                                  ? AppColors.success
                                  : AppColors.textPrimaryLight,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomButton(
            text: isDone ? 'Continue' : 'Match Pairs',
            onPressed: isDone
                ? () {
                    widget.onComplete(_mistakes <= 1);
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
