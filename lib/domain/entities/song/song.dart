import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String url;
  final String imageUrl;
  final bool isFavourite;
  final String songId;

  SongEntity({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.url, 
    required this.imageUrl,
    required this.isFavourite,
    required this.songId
  });
}
