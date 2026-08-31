import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../common/custom_button.dart';

class WritingTraceWidget extends StatefulWidget {
  final WritingTraceExercise exercise;
  final Function(bool isCorrect) onComplete;

  const WritingTraceWidget({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  @override
  State<WritingTraceWidget> createState() => _WritingTraceWidgetState();
}

class _WritingTraceWidgetState extends State<WritingTraceWidget> {
  final List<Offset?> _points = [];

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
              const SizedBox(height: 8),
              Center(
                child: Text(
                  widget.exercise.characterName,
                  style: AppTypography.romanization,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderLight, width: 2),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    widget.exercise.targetCharacter,
                    style: TextStyle(
                      fontSize: 160,
                      color: Colors.grey.shade200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      final renderBox = context.findRenderObject() as RenderBox?;
                      if (renderBox != null) {
                        _points.add(details.localPosition);
                      }
                    });
                  },
                  onPanEnd: (_) => _points.add(null),
                  child: CustomPaint(
                    painter: _TracePainter(_points),
                    size: Size.infinite,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _points.clear();
                    });
                  },
                  child: const Text('Clear Canvas'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: 'Submit Stroke',
                  onPressed: _points.isNotEmpty
                      ? () {
                          widget.onComplete(true);
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _TracePainter extends CustomPainter {
  final List<Offset?> points;

  _TracePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TracePainter oldDelegate) => true;
}
