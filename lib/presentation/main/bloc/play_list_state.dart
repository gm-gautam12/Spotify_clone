import 'package:soptify/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;
  PlayListLoaded({required this.songs});
}

class PlaylistLoadFailure extends PlayListState {}

/// The above Dart code defines different states for a playlist, including loading, loaded with songs,
/// and failure to load.

