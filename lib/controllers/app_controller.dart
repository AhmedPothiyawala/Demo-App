import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicaltask/custome%20function/Custome_Strings/heading.dart';
import 'package:practicaltask/global.dart';
import '../views/home_screen.dart';

class LoginController extends GetxController {
  final RxBool isLoggedIn = RxBool(false);

  void login(BuildContext context, String mobile, String password) {
    var get_auth = Authenticate();

    if (mobile == get_auth.mobile_number && password == get_auth.password) {
      isLoggedIn.value = true;
      Get.snackbar(Heading.success_title, Heading.success_sub_title,
          backgroundColor: Colors.green,
          icon: Icon(
            Icons.check_circle_rounded,
            size: 30,
          ),
          snackPosition: SnackPosition.TOP);
      Get.to(HomeScreen());
    } else {
      Get.snackbar(Heading.invalid_title, Heading.invalid_sub_title,
          backgroundColor: Colors.red,
          icon: Icon(
            Icons.error,
            size: 30,
          ),
          snackPosition: SnackPosition.TOP);
    }
  }
}
