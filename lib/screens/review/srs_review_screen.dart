import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../widgets/common/custom_button.dart';

class SrsReviewScreen extends StatelessWidget {
  const SrsReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SRS Review', style: AppTypography.h3),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.done_all_rounded, color: AppColors.success, size: 80),
              const SizedBox(height: 16),
              Text('All Caught Up!', style: AppTypography.h1),
              const SizedBox(height: 8),
              Text(
                'ယနေ့အတွက် Spaced Repetition ပြန်လှန်လေ့ကျင့်စရာများ ပြီးမြောက်သွားပါပြီ။',
                style: AppTypography.myanmarText.copyWith(color: AppColors.textSecondaryLight),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Back to Home',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
