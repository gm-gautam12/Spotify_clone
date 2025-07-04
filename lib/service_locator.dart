import 'package:get_it/get_it.dart';
import 'package:soptify/data/repository/auth/auth_repository_impl.dart';
import 'package:soptify/data/repository/song/song_repository_impl.dart';
import 'package:soptify/data/service/auth/auth_firebase_service.dart';
import 'package:soptify/data/service/song/song_firebase_service.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/domain/usecase/auth/get_user_usecase.dart';
import 'package:soptify/domain/usecase/auth/signup_usecase.dart';
import 'package:soptify/domain/usecase/auth/signin_usecase.dart';
import 'package:soptify/domain/usecase/song/add_remove_favourite.dart';
import 'package:soptify/domain/usecase/song/get_favourite_song.dart';
import 'package:soptify/domain/usecase/song/get_new_songs_usecase.dart';
import 'package:soptify/domain/repository/song/song_reopsitory.dart';
import 'package:soptify/domain/usecase/song/get_playlist_usecase.dart';
import 'package:soptify/domain/usecase/song/is_favourite.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizeDependencies() async {

  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  serviceLocator.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceimpl()
  );
  
  serviceLocator.registerSingleton<SongReopsitory>(
    SongRepositoryImpl()
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );
  serviceLocator.registerSingleton<SignupUsecase>(
    SignupUsecase()
  );
  serviceLocator.registerSingleton<SigninUsecase>(
    SigninUsecase()
  );
  serviceLocator.registerSingleton<GetUserUsecase>(
    GetUserUsecase()
  );

  //song
  
  serviceLocator.registerSingleton<GetNewSongsUsecase>(
    GetNewSongsUsecase()
  );
  serviceLocator.registerSingleton<GetPlayListUsecase>(
    GetPlayListUsecase()
  );
  serviceLocator.registerSingleton<AddRemoveFavouriteusecase>(
    AddRemoveFavouriteusecase()
  );
  serviceLocator.registerSingleton<IsFavouriteUsecase>(
    IsFavouriteUsecase()
  );

  serviceLocator.registerSingleton<GetFavouriteSongUsecase>(
    GetFavouriteSongUsecase()
  );


}