import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/common/bloc/favourite_button/favourite_button_cubit.dart';
import 'package:soptify/common/bloc/favourite_button/favourite_button_state.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/domain/entities/song/song.dart';

class FavouriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  const FavouriteButton({required this.songEntity, super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteButtonCubit(),
      child: BlocBuilder<FavouriteButtonCubit,FavouriteButtonState>(
        builder: (context,state) {
          if(state is FavouriteButtonInitial){
            return IconButton(
            onPressed: () async {
              context.read<FavouriteButtonCubit>().favouriteButtonUpdated(songEntity.songId);
              if(function != null){
                function!();
              }
            }, 
            icon: Icon(
              songEntity.isFavourite ? Icons.favorite: Icons.favorite_outline_outlined,
              color: AppColors.darkGrey,
            )
            );
          }

          if(state is FavouriteButtonUpdated) {
            return IconButton(
            onPressed: (){
              context.read<FavouriteButtonCubit>().favouriteButtonUpdated(songEntity.songId);
            }, 
            icon: Icon(
              state.isFavourite ? Icons.favorite: Icons.favorite_outline_outlined,
              color: AppColors.darkGrey,
            )
            );
          }


          return Container();


        }
      ),
    );
  }
}