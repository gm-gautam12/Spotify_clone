import 'package:dartz/dartz.dart';
import 'package:soptify/core/usecase/usecase.dart';
import 'package:soptify/data/model/auth/signin_user.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/service_locator.dart';

class SigninUsecase implements UseCase<Either, SigninUser> {
  @override
  Future<Either> call({SigninUser? params}) async {
    return serviceLocator<AuthRepository>().signin(params!);
  }
  
}