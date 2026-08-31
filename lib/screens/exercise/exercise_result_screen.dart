import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../widgets/common/custom_button.dart';

class ExerciseResultScreen extends StatelessWidget {
  final String title;
  final int totalQuestions;
  final int correctAnswers;
  final int chapterIndex;
  final int unitIndex;

  const ExerciseResultScreen({
    super.key,
    required this.title,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.chapterIndex,
    required this.unitIndex,
  });

  @override
  Widget build(BuildContext context) {
    final scoreRatio = totalQuestions > 0 ? correctAnswers / totalQuestions : 0.0;
    final isPassed = scoreRatio >= 0.7;
    final earnedXp = (scoreRatio * 50).round();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(
                isPassed ? Icons.check_circle_rounded : Icons.replay_rounded,
                color: isPassed ? AppColors.success : AppColors.accent,
                size: 88,
              ),
              const SizedBox(height: 20),
              Text(
                isPassed ? 'Lesson Completed!' : 'Keep Practicing!',
                style: AppTypography.h1,
              ),
              const SizedBox(height: 8),
              Text(
                isPassed
                    ? 'သင်ခန်းစာကို အောင်မြင်စွာ ပြီးမြောက်ခဲ့ပါပြီ'
                    : 'ထပ်မံလေ့ကျင့်ပြီး အမှတ်ပိုမို ရယူပါ',
                style: AppTypography.myanmarText
                    .copyWith(color: AppColors.textSecondaryLight),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Accuracy', style: AppTypography.bodySmall),
                        const SizedBox(height: 4),
                        Text(
                          '${(scoreRatio * 100).toInt()}%',
                          style: AppTypography.h2
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Earned XP', style: AppTypography.bodySmall),
                        const SizedBox(height: 4),
                        Text(
                          '+$earnedXp',
                          style:
                              AppTypography.h2.copyWith(color: AppColors.accent),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Back to Unit',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
