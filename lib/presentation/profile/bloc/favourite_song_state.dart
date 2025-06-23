import 'package:soptify/domain/entities/song/song.dart';

abstract class FavouriteSongState {}

class FavouriteSongLoading extends FavouriteSongState{}

class FavouriteSongLoaded extends FavouriteSongState{
  final List<SongEntity>favouriteSong;

  FavouriteSongLoaded({required this.favouriteSong});
  
}

class FavouriteSongFailure extends FavouriteSongState{}