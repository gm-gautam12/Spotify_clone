import 'package:dartz/dartz.dart';
import 'package:soptify/core/usecase/usecase.dart';
import 'package:soptify/data/model/auth/create_user.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/service_locator.dart';

class SignupUsecase implements UseCase<Either, CreateUser> {
  @override
  Future<Either> call({CreateUser? params}) async {
    return serviceLocator<AuthRepository>().signup(params!);
  }
  
}