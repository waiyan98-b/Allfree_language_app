import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/script_model.dart';
import '../../models/vocabulary_model.dart';

class ScriptCard extends StatelessWidget {
  final ScriptModel script;
  final VoidCallback? onAudioTap;

  const ScriptCard({
    super.key,
    required this.script,
    this.onAudioTap,
  });

  Color _getClassColor(ConsonantClass cClass) {
    switch (cClass) {
      case ConsonantClass.middle:
        return AppColors.toneMid;
      case ConsonantClass.high:
        return AppColors.toneFalling;
      case ConsonantClass.low:
        return AppColors.toneLow;
      case ConsonantClass.none:
        return AppColors.textSecondaryLight;
    }
  }

  String _getClassText(ConsonantClass cClass) {
    switch (cClass) {
      case ConsonantClass.middle:
        return 'Middle Class (အလယ်သံ)';
      case ConsonantClass.high:
        return 'High Class (အမြင့်သံ)';
      case ConsonantClass.low:
        return 'Low Class (အနိမ့်သံ)';
      case ConsonantClass.none:
        return 'Vowel / Symbol';
    }
  }

  @override
  Widget build(BuildContext context) {
    final classColor = _getClassColor(script.consonantClass);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.borderLight, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: classColor.withAlpha(25),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: classColor, width: 1.5),
                  ),
                  child: Text(
                    script.symbol,
                    style: AppTypography.thaiDisplay.copyWith(
                      color: classColor,
                      fontSize: 38,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        script.nameThai,
                        style: AppTypography.thaiLarge.copyWith(fontSize: 20),
                      ),
                      Text(
                        '${script.nameRoman} • ${script.nameMyanmar}',
                        style: AppTypography.romanization.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: classColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _getClassText(script.consonantClass),
                          style: AppTypography.toneLabel.copyWith(
                            color: classColor,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (script.initialSound.isNotEmpty || script.finalSound.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Initial Sound: ${script.initialSound}',
                    style: AppTypography.bodySmall,
                  ),
                  Text(
                    'Final Sound: ${script.finalSound.isEmpty ? "-" : script.finalSound}',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
