import 'package:flutter/material.dart';
import 'package:practicaltask/custome%20function/Colors/constants.dart';
import 'package:practicaltask/custome%20function/Custome_Strings/heading.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.top_gradient,
      body: SplashScreenView(
        navigateWhere: true,
        navigateRoute: LoginScreen(),
        text: WavyAnimatedText(
          Heading.splash_name,
          textStyle: const TextStyle(
            color: ConstColors.kPrimaryLightColor,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        imageSrc: "assets/images/logo.png",
      ),
    );
  }
}
