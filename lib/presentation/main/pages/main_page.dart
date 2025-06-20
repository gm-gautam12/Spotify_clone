import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/core/config/assets/app_images.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/presentation/main/widgets/new_songs.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: BasicAppBar(
        hideBack: true,
        titleLogo: SvgPicture.asset(AppVectors.logo,height: 33, width: 108,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 100),
            _homeArtistTopCard(),
            _tabOptions(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  NewSongs(),
                  Container(),
                  Container(),
                  Container(),
                ]
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _homeArtistTopCard() {
    return Center(
      child: SizedBox(
        height: 150,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(AppVectors.homeTopDesign)
              ),
              Positioned(
                left: 19,
                bottom: 15,
                  child: Image.asset(AppImages.homeTopLadyImage,alignment: Alignment.topCenter,fit: BoxFit.cover,)
              ),
          ]
      ),
     )
    );
  }

  Widget _tabOptions() {
  return Material(
    color: Colors.transparent,
    elevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    child: TabBar(
      controller: _tabController,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary, // Optional if you don't want any line
      dividerColor: Colors.transparent, // THIS removes the bottom line
      padding: EdgeInsets.symmetric(vertical:20, horizontal: 16),
      tabAlignment: TabAlignment.center,
      isScrollable: true,
      labelStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFFDADADA),
      ),
      tabs: [
        Tab(child: Text('News')),
        Tab(child: Text('Video')),
        Tab(child: Text('Artists')),
        Tab(child: Text('Podcasts')),
      ],
    ),
  );
}
}