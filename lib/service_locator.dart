import 'package:get_it/get_it.dart';
import 'package:soptify/data/repository/auth/auth_repository_impl.dart';
import 'package:soptify/data/service/auth/auth_firebase_service.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/domain/usecase/auth/signup_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizeDependencies() async {

  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );
  serviceLocator.registerSingleton<SignupUsecase>(
    SignupUsecase()
  );

}