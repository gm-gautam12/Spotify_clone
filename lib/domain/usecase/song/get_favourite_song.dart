import 'package:dartz/dartz.dart';
import 'package:soptify/core/usecase/usecase.dart';
import 'package:soptify/domain/repository/song/song_reopsitory.dart';
import 'package:soptify/service_locator.dart';

class GetFavouriteSongUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<SongReopsitory>().getUserFavouriteSongs();
  }
  
}