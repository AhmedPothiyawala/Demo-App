import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practicaltask/custome%20function/Colors/constants.dart';
import '../controllers/user_controller.dart';
import '../custome function/Custome_Strings/heading.dart';
import '../models/user.dart';
import 'Widgets/custome_widgets.dart';

class UserDialog extends StatelessWidget {
  final User user;

  UserDialog(this.user);

  @override
  Widget build(BuildContext context) {
    TextEditingController stock_controller = TextEditingController(
      text: user.stock.toString(),
    );

    return Dialog(
      backgroundColor: ConstColors.kPrimaryLightColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent dialog from expanding
          children: [
            Text('Update Stock for ${user.name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ConstColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: stock_controller,
              maxLength: 3,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: InputDecoration(
                counterText: "",
                hintText: "Enter stock between 0-100",
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ConstColors.bottom_gradient)),
              onPressed: () {
                if (stock_controller.text.isEmpty) {
                  Get.dialog(WarningDialog(Heading.stock_validation));
                } else if (int.parse(stock_controller.text) >= 101) {
                  Get.dialog(WarningDialog(Heading.stock_validation_length));
                } else {
                  Get.find<UserController>()
                      .updateUserStock(user, int.parse(stock_controller.text));
                  Get.back();
                  Get.snackbar(Heading.success_title, Heading.stock_updation,
                      backgroundColor: Colors.green,
                      icon: Icon(
                        Icons.check_circle_rounded,
                        size: 30,
                      ),
                      snackPosition: SnackPosition.TOP);
                }
              },
              child: Text('Update',
                  style: TextStyle(
                      color: ConstColors.kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
