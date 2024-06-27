class GetFeed{
  final String name;
  final String review;
  final int rating;
  final int image;

  GetFeed({
    required this.name,
    required this.review,
    required this.rating,
    required this.image,
  });

  factory GetFeed.fromJson(Map<String, dynamic> json) {
    return GetFeed(
      name: json['name'] ?? 'Unknown', // Provide a default value if null
      review: json['phone'] ?? 'Unknown', // Provide a default value if null
      rating: json['productName'] ?? 'Unknown', // Provide a default value if null
      image: json['image'] ?? 'Unknown', // Provide a default value if null
    );
  }
}
