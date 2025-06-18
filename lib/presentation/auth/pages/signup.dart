import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soptify/common/helpers/is_dark_mode.dart';
import 'package:soptify/common/widgets/appBar/app_bar.dart';
import 'package:soptify/common/widgets/button/basic_app_button.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/core/config/theme/app_color.dart';
import 'package:soptify/data/model/auth/create_user.dart';
import 'package:soptify/domain/usecase/auth/signup_usecase.dart';
import 'package:soptify/presentation/auth/pages/signin.dart';
import 'package:soptify/presentation/main/pages/main_page.dart';
import 'package:soptify/service_locator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Column(
        children: [
          BasicAppBar(
            titleLogo: SvgPicture.asset(AppVectors.logo, height: 33, width: 108,),
          ),
          _registerUser(context),
          _formData(context),
        ],
      )
    );
  }

  Widget _registerUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 9,),
          Text.rich(
            TextSpan(
            children: [
              TextSpan(
                text: 'If you need any support ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode ? Colors.white : Colors.blueGrey,
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

  Widget _formData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          TextField(
            controller: _fullName,
            decoration: InputDecoration(
              hintText: 'Full Name'
            ).applyDefaults(
              Theme.of(context).inputDecorationTheme
            )
          ),
          SizedBox(height: 9,),
          TextField(
             controller: _email,
            decoration: InputDecoration(
              hintText: 'Enter Email'
            ).applyDefaults(
              Theme.of(context).inputDecorationTheme
            )
          ),
          SizedBox(height: 9,),
          TextField(
             controller: _password,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ).applyDefaults(
              Theme.of(context).inputDecorationTheme,
            ),
          ),
          SizedBox(height: 20,),
          BasicAppButton(
            onPressed: () async {
              var result = await serviceLocator<SignupUsecase>().call(
                params: CreateUser(
                  fullName: _fullName.text.toString(),
                  email: _email.text.toString(), 
                  password: _password.text.toString()
                )
              );
              result.fold(
                (ifLeft){
                  var snackbar = SnackBar(content: Text(ifLeft),behavior: SnackBarBehavior.floating,);
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }, 

                (ifRight){
                  Navigator.pushAndRemoveUntil(
                    context,
                     MaterialPageRoute(builder: (BuildContext context) => MainPageScreen()),
                     (route) => false
                  );
                }
              );
            },
            title: 'Create Account',
            height: 70,
          ), 
        ],
      ),
    );
  }

  Widget _bottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do You Have An Account? ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => SignInPage())
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF278CE8),
              padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              minimumSize: Size(0, 0),
            ),
             child: Text('Sign In'),
          )
        ],
      ),
    );
  }

}
