import 'package:get_it/get_it.dart';
import 'package:soptify/data/repository/auth/auth_repository_impl.dart';
import 'package:soptify/data/repository/song/song_repository_impl.dart';
import 'package:soptify/data/service/auth/auth_firebase_service.dart';
import 'package:soptify/data/service/song/song_firebase_service.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/domain/usecase/auth/signup_usecase.dart';
import 'package:soptify/domain/usecase/auth/signin_usecase.dart';
import 'package:soptify/domain/usecase/song/get_new_songs_usecase.dart';
import 'package:soptify/domain/repository/song/song_reopsitory.dart';

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

  //song
  
  serviceLocator.registerSingleton<GetNewSongsUsecase>(
    GetNewSongsUsecase()
  );

}