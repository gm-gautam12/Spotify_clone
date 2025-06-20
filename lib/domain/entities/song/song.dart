import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String url;
  final String imageUrl;

  SongEntity({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.url, 
    required this.imageUrl,
  });

  factory SongEntity.fromJson(Map<String, dynamic> json) {
    return SongEntity(
      title: json['title'],
      artist: json['artist'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
      url: json['url'],
      imageUrl: json['imageUrl'],
    );
  }
}
