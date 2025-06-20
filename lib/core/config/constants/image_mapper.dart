class SongImageMapper {
  static const _images = {
    'calvin harris-dua lipa-one kiss': 'https://res.cloudinary.com/dmi5odiyw/image/upload/v1750435120/Calvin_Harris_Dua_Lipa_-_One_Kiss_mqvw0s.jpg',
    'enrique iglesias-tonight': 'https://res.cloudinary.com/dmi5odiyw/image/upload/v1750435121/Enrique_Iglesias_-_Tonight_iqdycf.jpg',
    'ed sheeran-shape of you': 'https://res.cloudinary.com/dmi5odiyw/image/upload/v1750435120/Ed_Sheeran_-_Shape_Of_You_t2yyll.jpg',
    'drake-in my feelings': 'https://res.cloudinary.com/dmi5odiyw/image/upload/v1750435120/Drake_-_In_My_Feelings_ww1keq.jpg',
    'billie eilish-khalid-lovely': 'https://res.cloudinary.com/dmi5odiyw/image/upload/v1750435120/Billie_Eilish_Khalid_-_lovely_koy2hh.jpg',
    'rihanna-diamonds': 'https://res.cloudinary.com/dmi5odiyw/image/upload/v1750435120/Rihanna_-_Diamonds_tqmiap.jpg',
  };

  static String? getImageUrl(String artist, String title) {
    final key = '${artist.trim().toLowerCase()}-${title.trim().toLowerCase()}';
    return _images[key];
  }
}
