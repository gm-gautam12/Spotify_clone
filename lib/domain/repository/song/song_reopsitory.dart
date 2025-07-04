import 'package:dartz/dartz.dart';

abstract class SongReopsitory {
  Future<Either>getNewSongs();
  Future<Either>getPlayList();
  Future<Either>addOrRemoveFavouriteSongs(String songId);
  Future<bool>isFavouriteSong(String songId);
  Future<Either>getUserFavouriteSongs();
}