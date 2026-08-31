import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/unit_model.dart';
import '../../widgets/common/custom_button.dart';
import '../exercise/exercise_runner_screen.dart';
import 'sections/vocab_section.dart';
import 'sections/grammar_section.dart';
import 'sections/dialogue_section.dart';
import 'sections/script_section.dart';

class LessonFlowScreen extends StatefulWidget {
  final UnitModel unit;

  const LessonFlowScreen({
    super.key,
    required this.unit,
  });

  @override
  State<LessonFlowScreen> createState() => _LessonFlowScreenState();
}

class _LessonFlowScreenState extends State<LessonFlowScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: _getTabCount(), vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  int _getTabCount() {
    int count = 1; // Vocabulary is standard
    if (widget.unit.scriptItems.isNotEmpty) count++;
    if (widget.unit.grammar.isNotEmpty) count++;
    if (widget.unit.dialogues.isNotEmpty) count++;
    return count;
  }

  List<Tab> _buildTabs() {
    final tabs = <Tab>[];
    if (widget.unit.scriptItems.isNotEmpty) {
      tabs.add(const Tab(text: 'Script'));
    }
    tabs.add(const Tab(text: 'Vocabulary'));
    if (widget.unit.grammar.isNotEmpty) {
      tabs.add(const Tab(text: 'Grammar'));
    }
    if (widget.unit.dialogues.isNotEmpty) {
      tabs.add(const Tab(text: 'Dialogue'));
    }
    return tabs;
  }

  List<Widget> _buildTabViews() {
    final views = <Widget>[];
    if (widget.unit.scriptItems.isNotEmpty) {
      views.add(ScriptSection(scriptItems: widget.unit.scriptItems));
    }
    views.add(VocabSection(vocabulary: widget.unit.vocabulary));
    if (widget.unit.grammar.isNotEmpty) {
      views.add(GrammarSection(grammar: widget.unit.grammar));
    }
    if (widget.unit.dialogues.isNotEmpty) {
      views.add(DialogueSection(dialogues: widget.unit.dialogues));
    }
    return views;
  }

  void _startExercises() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseRunnerScreen(
          title: '${widget.unit.title} - Exercises',
          exercises: widget.unit.exercises,
          chapterIndex: widget.unit.chapterIndex,
          unitIndex: widget.unit.unitIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(widget.unit.title, style: AppTypography.h3),
            Text(
              widget.unit.titleMyanmar,
              style: AppTypography.myanmarText.copyWith(
                fontSize: 12,
                color: AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabCtrl,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondaryLight,
          indicatorColor: AppColors.primary,
          tabs: _buildTabs(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Objective Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: AppColors.primaryLight.withAlpha(30),
              child: Row(
                children: [
                  const Icon(Icons.flag_rounded, color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Objective: ${widget.unit.objective}',
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Study Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabCtrl,
                children: _buildTabViews(),
              ),
            ),
            // Start Exercises Bottom Action
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                text: 'Practice & Test (${widget.unit.exercises.length} Exercises)',
                icon: Icons.play_arrow_rounded,
                onPressed: widget.unit.exercises.isNotEmpty ? _startExercises : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
