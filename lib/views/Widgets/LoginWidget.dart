import 'package:flutter/material.dart';
import '../../custome function/Colors/constants.dart';
import '../../custome function/Custome_Strings/heading.dart';

class LoginWidgets extends StatelessWidget {
  final Size size;

  const LoginWidgets({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: size.height * 0.2,
      ),
      Image.asset(
        "assets/images/logo.png",
        width: size.width * 0.5,
      ),
      SizedBox(
          width: size.width * 0.55,
          child: Divider(
            color: ConstColors.kPrimaryLightColor,
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${Heading.powerd_by}\t\t',
                style: TextStyle(
                    color: ConstColors.kPrimaryLightColor,
                    fontSize: 13),
              ),
              TextSpan(
                text: '${Heading.application_name}',
                style: TextStyle(
                    color: ConstColors.kPrimaryLightColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],);
  }
}
