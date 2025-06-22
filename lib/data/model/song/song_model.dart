import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soptify/domain/entities/song/song.dart';

class SongModel {
  
   String? title;
   String? artist;
   num? duration;
   Timestamp? releaseDate;
   String? url;
   String? imageUrl;
  bool? isFavourite;
  String? songId;

  SongModel(
    {
      required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate,
      required this.url,
      required this.imageUrl,
      required this.isFavourite,
      required this.songId
    }
  );

  SongModel.fromJson(Map<String, dynamic>data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    url = data['url'];
    imageUrl = data['imageUrl'];
  }

}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!, 
      duration: duration!, 
      releaseDate: releaseDate!, 
      url: url!,
      imageUrl: imageUrl!,
      isFavourite: isFavourite!,
      songId: songId!
    );
  }
}