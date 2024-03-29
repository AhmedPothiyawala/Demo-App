import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicaltask/views/splash_screen.dart';
import 'custome function/Custome_Strings/heading.dart';
import 'custome function/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_splashcreen.dart';
import 'views/home_screen.dart';
import 'views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  System_Orientation_and_SystemUIOverlayStyle_splashcreen();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Heading.application_name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
