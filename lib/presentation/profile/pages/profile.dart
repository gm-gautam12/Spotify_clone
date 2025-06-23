import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/common/widgets/favourite_button/favourite_button.dart';
import 'package:soptify/presentation/profile/bloc/favourite_song_cubit.dart';
import 'package:soptify/presentation/profile/bloc/favourite_song_state.dart';
import 'package:soptify/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:soptify/presentation/profile/bloc/profile_info_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        backgroundColor: context.isDarkMode ? Color(0xff2C2B2B) : Colors.white,
        titleLogo: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700, 
            color: context.isDarkMode ? Color(0xFFDDDDDD) : Colors.black,
            ),
          ),
        action: IconButton(
        onPressed: (){}, 
        icon: Icon(Icons.more_vert_rounded)
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          SizedBox(height: 30,),
          _favouriteSong()
        ],
      ),
    );
  }
  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height/3.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDarkMode ? Color(0xff2C2B2B) : Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(43),
            bottomRight: Radius.circular(43)
          )
        ),
        child:BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state){
            if(state is ProfileInfoLoading){
              return  Center(child: CircularProgressIndicator());
            }

            if(state is ProfileInfoLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 93,
                    width: 93,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(state.userEntity.imageUrl!)
                      ),
                    ),
                  ),
                  SizedBox(height: 11,),
                  Text(
                    state.userEntity.email!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFD7D4D4)
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    state.userEntity.fullName!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                  ),
                ],
              );
            }

            if(state is ProfileInfoFailure){
              return Center(child: Text("Please Try Again"));
            }

            return Container();
          }
        ),
      ),
    );
  }
  Widget _favouriteSong() {
    return BlocProvider(
      create: (context) => FavouriteSongCubit()..getFavouriteSong(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:16 ,horizontal:16 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("FAVOURITE SONGS",
             style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color:  Color(0xFFD5D5D5)
             ),
            ),
            SizedBox(height: 25,),
            BlocBuilder<FavouriteSongCubit,FavouriteSongState>(
              builder: (context,state) {
                if(state is FavouriteSongLoading){
                 return Center(child: CircularProgressIndicator());
                }
        
                if(state is FavouriteSongLoaded){
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 58,
                                width: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      state.favouriteSong[index].imageUrl
                                    ),
                                )
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.favouriteSong[index].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: context.isDarkMode ? Color(0xFFE3E3E3) : Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 3,),
                                  Text(
                                    state.favouriteSong[index].artist,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color:context.isDarkMode ? Color(0xFFE3E3E3) : Colors.black
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                                children: [
                                  Text(
                                    state.favouriteSong[index].duration
                                        .toString()
                                        .replaceAll('.', ':'),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          context.isDarkMode
                                              ? Color(0xFFD5D5D5)
                                              : Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 37,),
                                  FavouriteButton(songEntity: state.favouriteSong[index], 
                                  key: UniqueKey(),
                                   function: (){
                                    context.read<FavouriteSongCubit>().removeSong(index);
                                  },)
                                ],
                              ) 
                        ],
                        
                      );
                      
                    }, 
                    separatorBuilder: (context,index) => SizedBox(height: 20,), 
                    itemCount: state.favouriteSong.length
                  );
                }
        
                
              if(state is FavouriteSongFailure){
                return Center(child: Text("Please Try Again"));
              }
        
                return Container();
              }
            )
          ],
        ),
      ),
    );
  }
}