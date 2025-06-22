import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/domain/entities/song/song.dart';
import 'package:soptify/presentation/main/bloc/play_list_cubit.dart';
import 'package:soptify/presentation/main/bloc/play_list_state.dart';
import 'package:soptify/presentation/song_player/pages/play_song.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PlayListLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header row
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Playlist',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: context.isDarkMode 
                                ? const Color(0xFFDADADA) 
                                : Colors.black,
                          ),
                        ),
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: context.isDarkMode 
                                ? const Color(0xFFDADADA) 
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Song list
                  _songList(state.songs),
                  
                ],
              ),
            );
          }

          return const Center(child: Text('No new songs available.'));
        },
      ),
    );
  }

  Widget _songList(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: songs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (BuildContext context) => SongPlayerPage(songEntity: songs[index],))
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          context.isDarkMode
                              ? const Color(0xFF2B2B2B)
                              : const Color(0xff959595),
                    ),
                    child: Icon(Icons.play_arrow_rounded,
                      color: context.isDarkMode ? Color(0xff959595) : Color(0xFF2B2B2B),
                    )
                  ),
                  SizedBox(width: 23,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        songs[index].artist,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    songs[index].duration.toString().replaceAll('.', ':'),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode ? Color(0xFFD5D5D5) : Colors.black,
                    ),
                  ),
                  SizedBox(width: 49,),
                   IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline_outlined,
                      color: AppColors.darkGrey,
                    ),
                  )
                ]
              )            
            ],
          ),
        );
      },
    );
  }
}