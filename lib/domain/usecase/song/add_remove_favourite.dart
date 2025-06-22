import 'package:dartz/dartz.dart';
import 'package:soptify/core/usecase/usecase.dart';
import 'package:soptify/domain/repository/song/song_reopsitory.dart';
import 'package:soptify/service_locator.dart';

class AddRemoveFavouriteusecase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<SongReopsitory>().addOrRemoveFavouriteSongs(params!);
  }
  
}