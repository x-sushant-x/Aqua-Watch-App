class Post {
  final String id;
  final String user;
  final String date;
  final String time;
  final String imageUrl;
  final String description;
  final int damageScore;
  final List<double> coordinates;
  final String location;

  Post({
    required this.id,
    required this.user,
    required this.date,
    required this.time,
    required this.imageUrl,
    required this.description,
    required this.damageScore,
    required this.coordinates,
    required this.location,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      user: json['user'],
      date: json['date'],
      time: json['time'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      damageScore: json['damageScore'],
      coordinates: List<double>.from(json['coordinates']),
      location: json['location'],
    );
  }
}
