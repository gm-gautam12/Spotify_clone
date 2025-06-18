import 'package:soptify/data/model/auth/create_user.dart';
import 'package:soptify/data/service/auth/auth_firebase_service.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:soptify/data/model/auth/signin_user.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUser signinUser) async {
    return await serviceLocator<AuthFirebaseService>().signin(signinUser);
  }

  @override
  Future<Either> signup(CreateUser createUser)async {
    return await serviceLocator<AuthFirebaseService>().signup(createUser);
  }
} 