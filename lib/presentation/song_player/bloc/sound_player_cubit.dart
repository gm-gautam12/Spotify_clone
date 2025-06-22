 import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/presentation/song_player/bloc/sound_player_state.dart';

class SoundPlayerCubit extends Cubit<SoundPlayerState> {

  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SoundPlayerCubit() : super(SoundPlayerLoading()){

    audioPlayer.onPositionChanged.listen((Duration position) {
        songPosition = position;
        updateSongPlayer();
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      songDuration = duration;
    });
  }

  void updateSongPlayer() {
    emit(
      SoundPlayerLoaded(
        isPlaying: audioPlayer.state == PlayerState.playing,
        position: songPosition,
        duration: songDuration,
      ),
    );
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setSourceUrl(url);
      emit(
        SoundPlayerLoaded(
          isPlaying: false,
          position: Duration.zero,
          duration: songDuration,
        ),
      );
    } catch (e) {
      emit(SoundPlayerFailure());
    }
  }

  void playOrPauseSong() async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.resume();
    }
    emit(
      SoundPlayerLoaded(
        isPlaying: audioPlayer.state == PlayerState.playing,
        position: songPosition,
        duration: songDuration,
      ),
    );
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }

}