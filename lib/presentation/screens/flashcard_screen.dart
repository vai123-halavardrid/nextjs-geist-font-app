import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/flashcard_provider.dart';
import '../widgets/flashcard_widget.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({Key? key}) : super(key: key);

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  @override
  Widget build(BuildContext context) {
    final flashcardProvider = Provider.of<FlashcardProvider>(context);
    final flashcards = flashcardProvider.flashcards;

    return Scaffold(
      appBar: AppBar(
        title: Text(flashcardProvider.selectedSet?.title ?? 'Flashcards'),
      ),
      body: flashcards.isEmpty
          ? const Center(child: Text('No flashcards available'))
          : PageView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                final card = flashcards[index];
                return FlashcardWidget(flashcard: card);
              },
            ),
    );
  }
}
