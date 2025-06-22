import 'package:soptify/core/usecase/usecase.dart';
import 'package:soptify/domain/repository/song/song_reopsitory.dart';
import 'package:soptify/service_locator.dart';

class IsFavouriteUsecase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await serviceLocator<SongReopsitory>().isFavouriteSong(params!);
  }
  
}