class Flashcard {
  final String id;
  final String word;
  final String meaning;
  final String? imageUrl;

  Flashcard({
    required this.id,
    required this.word,
    required this.meaning,
    this.imageUrl,
  });

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      id: json['id'] as String,
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'word': word,
    'meaning': meaning,
    'imageUrl': imageUrl,
  };
}
