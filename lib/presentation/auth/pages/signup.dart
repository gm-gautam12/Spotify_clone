import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/core/config/theme/app_color.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BasicAppBar(
            titleLogo: SvgPicture.asset(AppVectors.logo, height: 33, width: 108,),
          ),
          _registerUser(),
          _formData(),
        ],
      )
    );
  }

  Widget _registerUser() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Register',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          ),
          SizedBox(height: 15,),
          Text.rich(
            TextSpan(
            children: [
              TextSpan(
                text: 'If you need any support ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey
                )
              ),
              TextSpan(
                text: 'Click here',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary
                )
              )
            ]
          )
          ),
        ],
      ),
    );
  }

  Widget _formData() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(30),
          hintText: 'Full Name',
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), // Customize focused border if needed
          borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), // Customize focused border if needed
          borderRadius: BorderRadius.circular(30),
        ),
        ),
      ),
    );
  }
}
