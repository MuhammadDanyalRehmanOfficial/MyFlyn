// app/models/campaign_model.dart
class Campaign {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final bool isLiked;

  Campaign({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    this.isLiked = false,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      isLiked: json['isLiked'] ?? false,
    );
  }
}
