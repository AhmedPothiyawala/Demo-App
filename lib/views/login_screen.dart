import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../controllers/exit_controller.dart';
import '../custome function/Colors/constants.dart';
import '../custome function/Custome_Strings/heading.dart';
import '../custome function/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_all_screen.dart';
import 'Widgets/LoginWidget.dart';
import 'Widgets/custome_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController mobile_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool _obscureText = true;
  var current;

  final login_controller = Get.put(LoginController());
  final exitConfirmationController = Get.put(ExitConfirmationController());

  @override
  Widget build(BuildContext context) {
    System_Orientation_and_SystemUIOverlayStyle_all_screen();
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () => exitConfirmationController.showExitConfirmation(),
      child: Scaffold(
          backgroundColor: ConstColors.kPrimaryColor,
          body: SingleChildScrollView(
              child: Column(
            children: [
              LoginWidgets(
                size: size,
              ),
              dynamic_textfield(
                  toggle,
                  _obscureText,
                  Heading.mobile_hint_text,
                  Icons.phone,
                  mobile_controller,
                  size),
              dynamic_textfield(
                  toggle,
                  _obscureText,
                  Heading.password_hint_text,
                  Icons.lock,
                  password_controller,
                  size),
              Padding(
                padding: EdgeInsets.only(
                    top: 30, left: size.width * 0.1, right: size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    dynamic_button(
                      Login_Api,
                      'Login',
                    ),

                  ],
                ),
              ),
            ],
          ))),
    );
  }

  void toggle() async {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void Login_Api() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (mobile_controller.text.isEmpty) {
      Get.dialog(WarningDialog(Heading.mobile_hint_text));
    } else if (mobile_controller.text.length <= 9) {
      Get.dialog(WarningDialog(Heading.mobile_validation));
    } else if (password_controller.text.isEmpty) {
      Get.dialog(WarningDialog(Heading.password_hint_text));
    } else {
      login_controller.login(
          context, mobile_controller.text, password_controller.text);
    }
  }
}
