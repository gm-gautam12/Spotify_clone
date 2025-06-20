import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:soptify/data/model/song/song_model.dart';
import 'package:soptify/domain/entities/song/song.dart';


abstract class SongFirebaseService {
  Future<Either>getNewSongs();
}

class SongFirebaseServiceimpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('songs').orderBy('releaseDate',descending: true).get();

      for(var element in data.docs){
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
        return left("An error occured, please try again");
    }

  }
  
}