import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soptify/data/model/song/song_model.dart';
import 'package:soptify/domain/entities/song/song.dart';
import 'package:soptify/domain/usecase/song/is_favourite.dart';
import 'package:soptify/service_locator.dart';


abstract class SongFirebaseService {
  Future<Either>getNewSongs();
  Future<Either>getPlayList();
  Future<Either>addOrRemoveFavouriteSongs(String songId);
  Future<bool>isFavouriteSong(String songId);
}

class SongFirebaseServiceimpl extends SongFirebaseService {

  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('songs').orderBy('releaseDate',descending: true).get();

      for(var element in data.docs){
        var songModel = SongModel.fromJson(element.data());
        bool isFavourite = await serviceLocator<IsFavouriteUsecase>().call(
          params: element.reference.id
        );
        songModel. isFavourite = isFavourite;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
        return left("An error occured, please try again");
    }

  }
  
  @override
  Future<Either> getPlayList() async {
   try {
     List<SongEntity> songs = [];
     var data = await FirebaseFirestore.instance.collection('songs').orderBy('releaseDate',descending: true).get();

     for(var element in data.docs){
      var songModel = SongModel.fromJson(element.data());
      bool isFavourite = await serviceLocator<IsFavouriteUsecase>().call(
        params: element.reference.id
      );
      songModel.isFavourite = isFavourite;
      songModel.songId = element.reference.id;
      songs.add(songModel.toEntity());
     }

     return Right(songs);
   } catch (e) {
       return left("An error occured, please try again");
   }
  }
  
  @override
  Future<Either> addOrRemoveFavouriteSongs(String songId) async {
    try {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    late bool isFavourite;
    var user = firebaseAuth.currentUser;
    String uId = user!.uid;

    QuerySnapshot favouriteSongs = await firebaseFirestore.collection('users').doc(uId).collection('favourites').where('songId',isEqualTo:songId).get();
    
    if(favouriteSongs.docs.isNotEmpty){
      await favouriteSongs.docs.first.reference.delete();
      isFavourite = false;
    }else{
      await firebaseFirestore.collection('users').doc(uId).collection('favourites').add({
        'songId' : songId,
        'addedDate': Timestamp.now()
      });
      isFavourite = true;
    }

    return right(isFavourite);

    } catch (e) {
      return left('An error occured');
    }

  }
  
  @override
  Future<bool> isFavouriteSong(String songId) async {
    try {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = firebaseAuth.currentUser;
    String uId = user!.uid;

    QuerySnapshot favouriteSongs = await firebaseFirestore.collection('users').doc(uId).collection('favourites').where('songId',isEqualTo:songId).get();
    
    if(favouriteSongs.docs.isNotEmpty){
      return true;
    }else{
      return false;
    }

    } catch (e) {
      return false;
    }

  }
  
}