import 'package:soptify/domain/entities/song/song.dart';

abstract class NewSongState {}

class NewSongLoading extends NewSongState {}

class NewSongsLoaded extends NewSongState {
  final List<SongEntity> songs;
  NewSongsLoaded({required this.songs});
}

class NewSongsLoadFailure extends NewSongState {}