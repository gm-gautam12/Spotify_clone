import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(
            titleLogo: SvgPicture.asset(AppVectors.logo, height: 33, width: 108,),
          ),
         SizedBox(height: 47,),
         Text('Register')

        ],
      )
    );
  }
}