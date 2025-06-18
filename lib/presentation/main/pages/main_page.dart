import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/core/config/assets/app_images.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

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
}