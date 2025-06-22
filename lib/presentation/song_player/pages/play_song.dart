import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/domain/entities/song/song.dart';
import 'package:soptify/presentation/song_player/bloc/sound_player_cubit.dart';
import 'package:soptify/presentation/song_player/bloc/sound_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({
    super.key,
    required this.songEntity
    });

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titleLogo: Text('Now Playing',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: Color(0xFFDDDDDD)),),
        action: IconButton(
        onPressed: (){}, 
        icon: Icon(Icons.more_vert_rounded)
        ),
      ),

      body: BlocProvider(
        create: (_) => SoundPlayerCubit()..loadSong(
          songEntity.url,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 29, horizontal: 16),
          child: Column(
            children: [
               _songCover(context),
               SizedBox(height: 17,),
               _songDetails(context),
               SizedBox(height: 40,),
               _songPlayer(context),
            ],
          ),
        ),
      )

    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            songEntity.imageUrl
          )
        ),
      ),
      
    );
  }

  Widget _songDetails(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: context.isDarkMode ? Color(0xFFDFDFDF) : Colors.black
              ),
            ),
            SizedBox(height: 5,),
            Text(
              songEntity.artist,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: context.isDarkMode ? Color(0xFFB9B9B9) : Colors.black
              ),
            )
          ],
        ),
        IconButton(
        onPressed: (){}, 
        icon: Icon(Icons.favorite_outline_outlined, color: AppColors.darkGrey,)
        )
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SoundPlayerCubit,SoundPlayerState>(
      builder: (context,state) {
        if(state is SoundPlayerLoading) {
            return const Center(child: CircularProgressIndicator());
        }
        if(state is SoundPlayerLoaded){
          return Column(
            children: [
              Slider(
                value: state.position.inSeconds.toDouble(),
                min: 0,
                max: state.duration.inSeconds.toDouble(), 
                onChanged: (value){},
                inactiveColor: Colors.white,
                activeColor: AppColors.primary,
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      formatDuration(state.position),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF868686)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      formatDuration(state.duration),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF868686)
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25,),
              GestureDetector(
                onTap: (){
                  context.read<SoundPlayerCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary
                  ),
                  child: Icon(
                    state.isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    size: 50,
                  ),
                ),
              )
            ],
          );
        }
        return const Center(child: Text('No songs available.'));
      }
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
  }
}