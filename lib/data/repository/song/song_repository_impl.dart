import 'package:dartz/dartz.dart';
import 'package:soptify/data/service/song/song_firebase_service.dart';
import 'package:soptify/domain/repository/song/song_reopsitory.dart';
import 'package:soptify/service_locator.dart';

class SongRepositoryImpl extends SongReopsitory {
  @override
  Future<Either> getNewSongs() async {
    return await serviceLocator<SongFirebaseService>().getNewSongs();
  }
  
  @override
  Future<Either> getPlayList()async {
    return await serviceLocator<SongFirebaseService>().getPlayList();
  }
  
  @override
  Future<Either> addOrRemoveFavouriteSongs(String songId) async{
    return await serviceLocator<SongFirebaseService>().addOrRemoveFavouriteSongs(songId);
  }
  
  @override
  Future<bool> isFavouriteSong(String songId) async {
    return await serviceLocator<SongFirebaseService>().isFavouriteSong(songId);
  }
  
  @override
  Future<Either> getUserFavouriteSongs() async {
    return await serviceLocator<SongFirebaseService>().getUserFavouriteSongs();
  }
  
}