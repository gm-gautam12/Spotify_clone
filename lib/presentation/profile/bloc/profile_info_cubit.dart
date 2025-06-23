import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/domain/usecase/auth/get_user_usecase.dart';
import 'package:soptify/presentation/profile/bloc/profile_info_state.dart';
import 'package:soptify/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await serviceLocator<GetUserUsecase>().call();

    user.fold(
    (left){
      emit(ProfileInfoFailure());
    }, 
    (userEntity){
      emit(ProfileInfoLoaded(userEntity: userEntity));
    }
    );
  }
}