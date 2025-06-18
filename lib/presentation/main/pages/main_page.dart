import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titleLogo: SvgPicture.asset(AppVectors.logo,height: 33, width: 108,),
      ),
      body: Column(
        
      ),
    );
  }
}