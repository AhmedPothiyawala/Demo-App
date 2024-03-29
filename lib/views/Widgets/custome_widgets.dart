import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practicaltask/custome function/Colors/constants.dart';
import '../../custome function/Custome_Strings/heading.dart';

Widget dynamic_textfield(
  onpressd,
  bool _obscureText,
  String hinttext,
  IconData icon,
  TextEditingController controller,
  Size size,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: ConstColors.kPrimaryColor,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller,
              maxLength: hinttext == Heading.password_hint_text ? 15 : 10,
              inputFormatters: [
                hinttext == Heading.password_hint_text
                    ? FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z0-9@_!]+'))
                    : FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                hinttext == Heading.password_hint_text
                    ? FilteringTextInputFormatter.deny(RegExp(r'^ +'))
                    : FilteringTextInputFormatter.deny(RegExp(r'^0+')),
              ],
              keyboardType: hinttext == Heading.password_hint_text
                  ? TextInputType.text
                  : TextInputType.number,
              obscureText:
                  hinttext == Heading.password_hint_text ? _obscureText : false,
              decoration: InputDecoration(
                  hintText: hinttext,
                  counterText: "",
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                      onTap: () => onpressd(),
                      child: Icon(
                        _obscureText == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ConstColors.kPrimaryColor,
                        size: hinttext == Heading.password_hint_text ? 30 : 0,
                      ))),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dynamic_button(onpressd, String heading) {
  return SizedBox(
    width: 250,
    height: 50,
    child: ElevatedButton(
      onPressed: onpressd,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColors.kPrimaryLightColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Curved edges
        ),
      ),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 32,
            color: ConstColors.bottom_gradient,
            fontWeight: FontWeight.w900),
      ),
    ),
  );
}

class WarningDialog extends StatelessWidget {
  final warning_text;

  const WarningDialog(this.warning_text);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ConstColors.top_gradient,
      child: new Container(
        width: 260.0,
        height: 200.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: ConstColors.top_gradient,
          borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: new Text(
                      'Error',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConstColors.kPrimaryLightColor,
                        fontSize: 24.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            new Expanded(
              child: new Container(
                  child: new Text(warning_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConstColors.kPrimaryLightColor,
                        fontSize: 18.0,
                      ))),
              flex: 1,
            ),

            // dialog bottom
            new Expanded(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: new Container(
                  padding: new EdgeInsets.all(16.0),
                  decoration: new BoxDecoration(
                    color: ConstColors.bottom_gradient,
                  ),
                  child: new Text(
                    'Okay',
                    style: TextStyle(
                      color: ConstColors.kPrimaryLightColor,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
