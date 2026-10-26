import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';

/// Every flashcard ever seeded from lessons — the user's learned vocabulary.
final allFlashcardsProvider = StreamProvider<List<FlashcardsTableData>>(
  (ref) => ref.watch(appDatabaseProvider).watchAllFlashcards(),
);

/// Total words learned, for the dashboard card.
final flashcardCountProvider = Provider<int>(
  (ref) => ref.watch(allFlashcardsProvider).value?.length ?? 0,
);
