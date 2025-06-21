import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/domain/usecase/song/get_playlist_usecase.dart';
import 'package:soptify/presentation/main/bloc/play_list_state.dart';
import 'package:soptify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit(): super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSong  =await serviceLocator<GetPlayListUsecase>().call();
    returnedSong.fold(
      (left) {
        emit(PlaylistLoadFailure());
      },
      (data) {
        emit(PlayListLoaded(songs: data));
      }
    );
  }
}

/// The PlayListCubit class is responsible for managing the state of a playlist in a Flutter application
/// using the Bloc pattern.