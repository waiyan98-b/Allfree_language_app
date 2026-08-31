import '../models/srs_item_model.dart';
import 'storage_service.dart';

class SrsService {
  final StorageService _storage;

  SrsService(this._storage);

  List<SRSItemModel> getDueReviews() {
    final allItems = _storage.loadAllSrsItems();
    final now = DateTime.now();
    return allItems.where((item) => item.nextReviewDate.isBefore(now)).toList();
  }

  Future<SRSItemModel> processReviewResult({
    required SRSItemModel item,
    required int quality, // 0 to 5 scale (SuperMemo-2)
  }) async {
    final cleanQuality = quality.clamp(0, 5);
    int newRepetitions = item.repetitions;
    int newInterval = item.intervalDays;
    double newEase = item.easeFactor;
    MasteryStage newStage = item.stage;

    if (cleanQuality >= 3) {
      if (newRepetitions == 0) {
        newInterval = 1;
        newStage = MasteryStage.learning;
      } else if (newRepetitions == 1) {
        newInterval = 6;
        newStage = MasteryStage.familiar;
      } else {
        newInterval = (newInterval * newEase).round();
        if (newInterval >= 21) {
          newStage = MasteryStage.mastered;
        }
      }
      newRepetitions += 1;
    } else {
      newRepetitions = 0;
      newInterval = 1;
      newStage = MasteryStage.learning;
    }

    newEase = newEase + (0.1 - (5 - cleanQuality) * (0.08 + (5 - cleanQuality) * 0.02));
    if (newEase < 1.3) newEase = 1.3;

    final now = DateTime.now();
    final nextDate = now.add(Duration(days: newInterval));

    final updatedItem = item.copyWith(
      repetitions: newRepetitions,
      intervalDays: newInterval,
      easeFactor: newEase,
      nextReviewDate: nextDate,
      lastReviewedDate: now,
    );

    await _storage.saveSrsItem(updatedItem);
    return updatedItem;
  }
}
