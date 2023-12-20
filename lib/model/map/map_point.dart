class MapPoint {
  final String imageUrl;
  final List<double> coordinates;
  final int damageScore;

  MapPoint({
    required this.imageUrl,
    required this.coordinates,
    required this.damageScore
  });

  factory MapPoint.fromJson(Map<String, dynamic> json) {
    return MapPoint(
      imageUrl: json['imageUrl'],
      coordinates: List<double>.from(json['coordinates']),
      damageScore: json['damageScore'],
    );
  }
}