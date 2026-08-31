import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/unit_model.dart';
import '../../widgets/common/custom_button.dart';
import '../lesson/lesson_flow_screen.dart';

class UnitDetailScreen extends StatelessWidget {
  final UnitModel unit;

  const UnitDetailScreen({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit ${unit.unitIndex}', style: AppTypography.h3),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(unit.title, style: AppTypography.h1),
              const SizedBox(height: 4),
              Text(
                unit.titleMyanmar,
                style: AppTypography.myanmarText.copyWith(
                  fontSize: 16,
                  color: AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 24),

              // Objective Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withAlpha(40),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.primary.withAlpha(80)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.track_changes_rounded, color: AppColors.primary, size: 20),
                        const SizedBox(width: 8),
                        Text('Learning Objective', style: AppTypography.h3.copyWith(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(unit.objective, style: AppTypography.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Overview Stats
              Text('Lesson Contents', style: AppTypography.h3),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildStatPill(Icons.font_download_rounded, '${unit.scriptItems.length} Letters'),
                  const SizedBox(width: 8),
                  _buildStatPill(Icons.translate_rounded, '${unit.vocabulary.length} Words'),
                  const SizedBox(width: 8),
                  _buildStatPill(Icons.psychology_rounded, '${unit.exercises.length} Exercises'),
                ],
              ),
              const Spacer(),

              // Start Lesson Action Button
              CustomButton(
                text: 'Start Study & Practice',
                icon: Icons.play_arrow_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonFlowScreen(unit: unit),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatPill(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(label, style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
