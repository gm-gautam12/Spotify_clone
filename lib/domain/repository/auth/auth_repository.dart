import 'package:dartz/dartz.dart';
import 'package:soptify/data/model/auth/create_user.dart';
import 'package:soptify/data/model/auth/signin_user.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUser createUser);
  Future<Either> signin(SigninUser signinUser);
  Future<Either> getUser();
}
