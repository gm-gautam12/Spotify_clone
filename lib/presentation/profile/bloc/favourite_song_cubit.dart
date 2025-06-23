import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/domain/entities/song/song.dart';
import 'package:soptify/domain/usecase/song/get_favourite_song.dart';
import 'package:soptify/presentation/profile/bloc/favourite_song_state.dart';
import 'package:soptify/service_locator.dart';

class FavouriteSongCubit extends Cubit<FavouriteSongState> {

  FavouriteSongCubit(): super(FavouriteSongLoading());

  List<SongEntity>favouriteSong = [];
  Future<void>getFavouriteSong() async{
    var result = await serviceLocator<GetFavouriteSongUsecase>().call();
    result.fold(
      (ifLeft){
        emit(FavouriteSongFailure());
      },
      (isRight){
        favouriteSong = isRight;
        emit(FavouriteSongLoaded(favouriteSong: favouriteSong));
      }
    );
  }

  void removeSong(int index) {
    favouriteSong.removeAt(index);
    emit(FavouriteSongLoaded(favouriteSong: favouriteSong));
  }
}