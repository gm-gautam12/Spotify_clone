import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/common/widgets/button/basic_app_button.dart';
import 'package:soptify/core/config/assets/app_images.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/presentation/auth/pages/signin.dart';
import 'package:soptify/presentation/auth/pages/signup.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topDesign,),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomDesign,),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBanner),
          ),
            Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  SizedBox(height: 55,),
                  Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: context.isDarkMode ? AppColors.lightBackground : Colors.black,
                    ),
                  ),
                  SizedBox(height: 21,),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode ? AppColors.grey : Colors.black,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                       flex: 1,
                       child: BasicAppButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignUpPage(),
                            )
                          );
                        }, 
                        title: 'Register',
                        height: 70,
                        ), 
                      ),
                      SizedBox(width: 22,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SingInPage(),
                            )
                          );
                        }, 
                        child: Text(
                          'Sign in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: context.isDarkMode ? AppColors.grey : Colors.black,
                          ),
                          )
                        )
                      ),
                    ],
                  ),

                  SizedBox(height: 100,)
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}