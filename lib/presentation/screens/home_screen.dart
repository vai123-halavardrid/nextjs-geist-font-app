import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/auth_provider.dart';
import '../../data/providers/flashcard_provider.dart';
import '../widgets/progress_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final flashcardProvider = Provider.of<FlashcardProvider>(context, listen: false);
    flashcardProvider.fetchVocabularySets();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final flashcardProvider = Provider.of<FlashcardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: flashcardProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${authProvider.user?.email ?? 'User'}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Progress',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  ProgressChart(
                    learnedPercent: flashcardProvider.learnedPercent,
                    notLearnedPercent: 100 - flashcardProvider.learnedPercent,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Vocabulary Sets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: flashcardProvider.vocabularySets.length,
                      itemBuilder: (context, index) {
                        final set = flashcardProvider.vocabularySets[index];
                        return Card(
                          child: ListTile(
                            title: Text(set.title),
                            subtitle: Text(set.description),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              flashcardProvider.selectVocabularySet(set);
                              Navigator.of(context).pushNamed('/flashcards');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
