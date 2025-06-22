import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/domain/entities/song/song.dart';
import 'package:soptify/presentation/main/bloc/new_song_cubit.dart';
import 'package:soptify/presentation/main/bloc/new_song_state.dart';
import 'package:soptify/presentation/song_player/pages/play_song.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewSongCubit, NewSongState>(
          builder: (context, state) {
            if(state is NewSongLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if(state is NewSongsLoaded) {
               return _song(state.songs);

            }

            return Center(child: Text('No new songs available.'));
          }
        ),
      ),
    );
  }

  Widget _song(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final song = songs[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (BuildContext context) => SongPlayerPage(songEntity: songs[index],))
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(song.imageUrl)
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: ShapeDecoration(
                        color: context.isDarkMode ? Color(0xFF2B2B2B) : Color(0xff959595), 
                        shape: OvalBorder()
                      ),
                      child: Icon(Icons.play_arrow_rounded,
                      color: context.isDarkMode ? Color(0xff959595) : Color(0xFF2B2B2B)
                      ),
                    ),
                          
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    songs[index].title,
                    style: TextStyle(
                      color: context.isDarkMode ? Color(0xFFE1E1E1) : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                 SizedBox(height: 5,),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    songs[index].artist,
                    style: TextStyle(
                      color: context.isDarkMode ? Color(0xFFE1E1E1) : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 14),
      itemCount: songs.length,
    );
  }

}