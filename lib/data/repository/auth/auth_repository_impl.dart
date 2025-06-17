import 'package:soptify/data/model/auth/create_user.dart';
import 'package:soptify/data/sources/auth/auth_firebase_service.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUser createUser)async {
    await serviceLocator<AuthFirebaseService>().signup(createUser);
  }
} 