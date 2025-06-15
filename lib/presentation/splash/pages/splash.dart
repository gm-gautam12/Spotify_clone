import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soptify/core/config/assets/app_vectors.dart';
import 'package:soptify/presentation/intro/pages/get_started.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      )
    );
  }

  Future<void> redirect() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => GetStartedPage())
    );
  }
 
}