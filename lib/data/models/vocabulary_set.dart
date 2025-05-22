class VocabularySet {
  final String id;
  final String title;
  final String description;

  VocabularySet({
    required this.id,
    required this.title,
    required this.description,
  });

  factory VocabularySet.fromJson(Map<String, dynamic> json) {
    return VocabularySet(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
  };
}
