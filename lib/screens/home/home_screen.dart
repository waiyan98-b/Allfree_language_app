import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../services/progress_service.dart';
import '../../data/curriculum_data.dart';
import '../curriculum/chapter_list_screen.dart';
import '../curriculum/unit_detail_screen.dart';
import '../review/srs_review_screen.dart';
import '../reference/reference_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressService>();
    final chapters = CurriculumData.getChapters();

    return Scaffold(
      appBar: AppBar(
        title: Text('Allfree Thai', style: AppTypography.h2.copyWith(fontSize: 22)),
        actions: [
          Row(
            children: [
              const Icon(Icons.local_fire_department_rounded, color: AppColors.streakFlame, size: 22),
              const SizedBox(width: 4),
              Text('${progress.streak}d', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              const Icon(Icons.favorite_rounded, color: AppColors.heartRed, size: 20),
              const SizedBox(width: 4),
              Text('${progress.hearts}', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              const Icon(Icons.stars_rounded, color: AppColors.xpGold, size: 22),
              const SizedBox(width: 4),
              Text('${progress.xp}', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Master Thai Systematically',
                      style: AppTypography.h2.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '၁၂ ခန်းပါ သင်ရိုးညွှန်းတမ်းဖြင့် ထိုင်းစကားကို စနစ်တကျ လေ့လာပါ',
                      style: AppTypography.myanmarText.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (chapters.isNotEmpty && chapters.first.units.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UnitDetailScreen(
                                unit: chapters.first.units.first,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Continue Learning'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quick Action Grid
              Text('Quick Actions', style: AppTypography.h3),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickCard(
                      context,
                      title: 'SRS Review',
                      subtitle: 'Flashcard Drills',
                      icon: Icons.sync_rounded,
                      color: AppColors.accent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SrsReviewScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickCard(
                      context,
                      title: 'Tone Chart',
                      subtitle: 'Reference Matrix',
                      icon: Icons.grid_view_rounded,
                      color: AppColors.primary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReferenceScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Current Course Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Curriculum Roadmap', style: AppTypography.h3),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChapterListScreen()),
                      );
                    },
                    child: const Text('View All 12'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Preview Chapters List
              ...chapters.take(3).map((chapter) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: AppColors.borderLight),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryLight,
                      child: Text(
                        '${chapter.chapterIndex}',
                        style: const TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(chapter.title, style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text(chapter.titleMyanmar, style: AppTypography.myanmarText.copyWith(fontSize: 12)),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChapterListScreen()),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withAlpha(60)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(title, style: AppTypography.h3.copyWith(fontSize: 15)),
            const SizedBox(height: 2),
            Text(subtitle, style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondaryLight)),
          ],
        ),
      ),
    );
  }
}
