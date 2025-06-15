import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/core/config/assets/app_images.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/common/widgets/button/basic_app_button.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/presentation/auth/pages/signup_or_signin.dart';
import 'package:soptify/presentation/chooseMode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40,horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.chooseModeBanner),fit: BoxFit.cover),
            ),
          ),

           Container(
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppVectors.logo),
                  ),
                  Spacer(),
            
                  Text(
                    'Choose Mode',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 65),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 73,
                                  height: 73,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(255, 255, 255, 0.16)
                                  ),
                                  child: SvgPicture.asset(AppVectors.darkMode, fit:BoxFit.none),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:3),
                          Text('Dark Mode',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey
                          ),),
                        ],
                      ),
                      
            
                      SizedBox(width: 60),
            
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                child: Container(
                                  width: 73,
                                  height: 73,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(255, 255, 255, 0.16)
                                  ),
                                  child: SvgPicture.asset(AppVectors.lightMode,fit: BoxFit.none,),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:3),
                          Text('Light Mode',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                             color: AppColors.grey
                          ),),
                        ],
                      )
            
                    ],
                  ),
            
                  SizedBox(height: 65),
                  BasicAppButton(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AuthenticationPage(),
                        ),
                      );
                    },
                       title: 'Continue',
                    ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}