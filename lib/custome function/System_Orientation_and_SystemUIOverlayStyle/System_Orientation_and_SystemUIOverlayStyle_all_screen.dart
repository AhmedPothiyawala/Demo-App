import 'package:flutter/services.dart';
import 'package:practicaltask/custome%20function/Colors/constants.dart';

Future<void> System_Orientation_and_SystemUIOverlayStyle_all_screen() async {
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ConstColors.kPrimaryColor,
    statusBarColor: ConstColors.kPrimaryColor,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}
