import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../data/curriculum_data.dart';
import 'unit_detail_screen.dart';

class ChapterListScreen extends StatelessWidget {
  const ChapterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = CurriculumData.getChapters();

    return Scaffold(
      appBar: AppBar(
        title: Text('12-Chapter Curriculum', style: AppTypography.h3),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          final hasUnits = chapter.units.isNotEmpty;

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.borderLight),
            ),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: hasUnits ? AppColors.primary : Colors.grey.shade400,
                foregroundColor: Colors.white,
                child: Text('${chapter.chapterIndex}'),
              ),
              title: Text(
                chapter.title,
                style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${chapter.titleMyanmar} • CEFR ${chapter.cefrLevel}',
                style: AppTypography.myanmarText.copyWith(fontSize: 12),
              ),
              children: hasUnits
                  ? chapter.units.map((unit) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        leading: const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 20),
                        title: Text('Unit ${unit.unitIndex}: ${unit.title}', style: AppTypography.bodyMedium),
                        subtitle: Text(unit.titleMyanmar, style: AppTypography.myanmarText.copyWith(fontSize: 12)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UnitDetailScreen(unit: unit),
                            ),
                          );
                        },
                      );
                    }).toList()
                  : [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Units for this chapter are being added in upcoming content updates.',
                          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ),
                    ],
            ),
          );
        },
      ),
    );
  }
}
