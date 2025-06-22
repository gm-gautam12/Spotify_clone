import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/common/bloc/favourite_button/favourite_button_state.dart';
import 'package:soptify/domain/usecase/song/add_remove_favourite.dart';
import 'package:soptify/service_locator.dart';

class FavouriteButtonCubit extends Cubit<FavouriteButtonState> {
  FavouriteButtonCubit() : super(FavouriteButtonInitial());

  void favouriteButtonUpdated(String songId) async {
    var result = await serviceLocator<AddRemoveFavouriteusecase>().call(
      params: songId
    );

    result.fold(
      (isLeft){}, 
      (isFavourite){
        emit(FavouriteButtonUpdated(isFavourite: isFavourite));
      }
    );
  }
}