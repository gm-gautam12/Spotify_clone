abstract class SoundPlayerState {}


class SoundPlayerLoading extends SoundPlayerState {}

class SoundPlayerLoaded extends SoundPlayerState {
  final bool isPlaying;
  final Duration position;
  final Duration duration;

  SoundPlayerLoaded({
    required this.isPlaying,
    required this.position,
    required this.duration,
  });
}

class SoundPlayerFailure extends SoundPlayerState {}