import 'package:dartz/dartz.dart';

abstract class SongReopsitory {
  Future<Either>getNewSongs();
  Future<Either>getPlayList();
}