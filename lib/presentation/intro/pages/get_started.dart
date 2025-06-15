import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soptify/common/widgets/button/basic_app_button.dart';
import 'package:soptify/core/config/assets/app_images.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/presentation/chooseMode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // image
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
            decoration: BoxDecoration(
              image: DecorationImage( fit: BoxFit.fill, image:AssetImage( AppImages.introBanner ))
            ),
          ),

          Container(
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppVectors.logo),
                    ),
                    Spacer(),
                    Text(
                      'Enjoy listening to music',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white ,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 21),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 21),
                    BasicAppButton(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ChooseMode(),
                        ),
                      );
                    },
                       title: 'Get Started',
                    ),
                  ],
                ),
            ),
          ),

        ],
      ),
    );
  }
}