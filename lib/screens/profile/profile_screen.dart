import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../services/progress_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressService>();
    final scores = progress.progress.skillScores;

    return Scaffold(
      appBar: AppBar(
        title: Text('Learner Profile', style: AppTypography.h3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // User Header
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.person_rounded, size: 48, color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            Text('Thai Learner', style: AppTypography.h2),
            Text('CEFR Target: B2 Mastery', style: AppTypography.bodySmall),
            const SizedBox(height: 24),

            // 4-Skill Proficiency Breakdown
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.borderLight),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('4-Skill Proficiency', style: AppTypography.h3),
                    const SizedBox(height: 16),
                    _buildSkillRow('Listening (နားထောင်မှု)', scores.listening, AppColors.primary),
                    const SizedBox(height: 12),
                    _buildSkillRow('Speaking (ပြောဆိုမှု)', scores.speaking, AppColors.accent),
                    const SizedBox(height: 12),
                    _buildSkillRow('Reading (ဖတ်ရှုမှု)', scores.reading, AppColors.toneLow),
                    const SizedBox(height: 12),
                    _buildSkillRow('Writing (ရေးသားမှု)', scores.writing, AppColors.toneFalling),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillRow(String label, double score, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
            Text('${score.toInt()}%', style: AppTypography.bodySmall),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: score / 100,
          color: color,
          backgroundColor: Colors.grey.shade200,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
