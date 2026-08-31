import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/exercise_model.dart';
import '../../widgets/common/app_progress_bar.dart';
import '../../widgets/exercises/flashcard_exercise_widget.dart';
import '../../widgets/exercises/multiple_choice_exercise_widget.dart';
import '../../widgets/exercises/matching_exercise_widget.dart';
import '../../widgets/exercises/fill_blank_exercise_widget.dart';
import '../../widgets/exercises/word_ordering_exercise_widget.dart';
import '../../widgets/exercises/translation_exercise_widget.dart';
import '../../widgets/exercises/listening_choice_widget.dart';
import '../../widgets/exercises/dictation_exercise_widget.dart';
import '../../widgets/exercises/speaking_exercise_widget.dart';
import '../../widgets/exercises/reading_exercise_widget.dart';
import '../../widgets/exercises/writing_trace_widget.dart';
import 'exercise_result_screen.dart';

class ExerciseRunnerScreen extends StatefulWidget {
  final String title;
  final List<ExerciseModel> exercises;
  final int chapterIndex;
  final int unitIndex;

  const ExerciseRunnerScreen({
    super.key,
    required this.title,
    required this.exercises,
    required this.chapterIndex,
    required this.unitIndex,
  });

  @override
  State<ExerciseRunnerScreen> createState() => _ExerciseRunnerScreenState();
}

class _ExerciseRunnerScreenState extends State<ExerciseRunnerScreen> {
  int _currentIndex = 0;
  int _correctCount = 0;

  void _onExerciseComplete(bool isCorrect) {
    if (isCorrect) _correctCount++;

    if (_currentIndex < widget.exercises.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseResultScreen(
            title: widget.title,
            totalQuestions: widget.exercises.length,
            correctAnswers: _correctCount,
            chapterIndex: widget.chapterIndex,
            unitIndex: widget.unitIndex,
          ),
        ),
      );
    }
  }

  Widget _buildCurrentExercise(ExerciseModel item) {
    switch (item.type) {
      case ExerciseType.flashcard:
      case ExerciseType.review:
        return FlashcardExerciseWidget(
          exercise: item as FlashcardExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.multipleChoice:
        return MultipleChoiceExerciseWidget(
          exercise: item as MultipleChoiceExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.matching:
        return MatchingExerciseWidget(
          exercise: item as MatchingExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.fillInBlank:
        return FillBlankExerciseWidget(
          exercise: item as FillInBlankExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.wordOrdering:
        return WordOrderingExerciseWidget(
          exercise: item as WordOrderingExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.translation:
        return TranslationExerciseWidget(
          exercise: item as TranslationExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.listeningChoice:
        return ListeningChoiceWidget(
          exercise: item as ListeningChoiceExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.dictation:
        return DictationExerciseWidget(
          exercise: item as DictationExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.speaking:
        return SpeakingExerciseWidget(
          exercise: item as SpeakingExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.readingComprehension:
        return ReadingExerciseWidget(
          exercise: item as ReadingComprehensionExercise,
          onComplete: _onExerciseComplete,
        );
      case ExerciseType.writingTrace:
        return WritingTraceWidget(
          exercise: item as WritingTraceExercise,
          onComplete: _onExerciseComplete,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.exercises.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('No exercises available.')),
      );
    }

    final currentExercise = widget.exercises[_currentIndex];
    final progressVal = (_currentIndex + 1) / widget.exercises.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: AppTypography.h3),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppProgressBar(progress: progressVal),
          ),
        ),
      ),
      body: SafeArea(
        child: _buildCurrentExercise(currentExercise),
      ),
    );
  }
}
