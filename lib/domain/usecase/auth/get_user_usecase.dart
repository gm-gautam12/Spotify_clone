import 'package:dartz/dartz.dart';
import 'package:soptify/core/usecase/usecase.dart';
import 'package:soptify/domain/repository/auth/auth_repository.dart';
import 'package:soptify/service_locator.dart';

class GetUserUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<AuthRepository>().getUser();
  }
  
}