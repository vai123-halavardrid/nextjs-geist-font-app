import 'package:flutter/material.dart';
import '../models/vocabulary_set.dart';
import '../models/flashcard.dart';

class FlashcardProvider extends ChangeNotifier {
  List<VocabularySet> vocabularySets = [];
  VocabularySet? selectedSet;
  List<Flashcard> flashcards = [];
  bool isLoading = false;
  double learnedPercent = 0.0;

  Future<void> fetchVocabularySets() async {
    isLoading = true;
    notifyListeners();

    // TODO: Replace with actual Firebase Firestore fetch
    await Future.delayed(const Duration(seconds: 1));
    vocabularySets = [
      VocabularySet(id: '1', title: 'Basic Words', description: 'Common English words'),
      VocabularySet(id: '2', title: 'Advanced Words', description: 'Advanced vocabulary'),
    ];

    isLoading = false;
    notifyListeners();
  }

  void selectVocabularySet(VocabularySet set) {
    selectedSet = set;
    // TODO: Fetch flashcards for the selected set from Firestore
    flashcards = [
      Flashcard(id: '1', word: 'Hello', meaning: 'Xin chào', imageUrl: null),
      Flashcard(id: '2', word: 'World', meaning: 'Thế giới', imageUrl: null),
    ];
    learnedPercent = 50.0; // Example value
    notifyListeners();
  }
}
