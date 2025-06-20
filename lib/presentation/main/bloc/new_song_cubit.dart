import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/domain/usecase/song/get_new_songs_usecase.dart';
import 'package:soptify/presentation/main/bloc/new_song_state.dart';
import 'package:soptify/service_locator.dart';

class NewSongCubit extends Cubit<NewSongState> {
  NewSongCubit(): super(NewSongLoading());

  Future<void> getNewsSongs() async {
    var returnedSong  =await serviceLocator<GetNewSongsUsecase>().call();
    returnedSong.fold(
      (left) {
        emit(NewSongsLoadFailure());
      },
      (data) {
        emit(NewSongsLoaded(songs: data));
      }
    );
  }
}