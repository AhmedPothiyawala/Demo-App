import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:practicaltask/custome%20function/Colors/constants.dart';
import 'user_dialog.dart';
import '../models/user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          user.stockStatus == "High" ? Colors.red : ConstColors.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Theme.of(context).brightness == Brightness.light
              ? ConstColors.bottom_gradient
              : ConstColors.kPrimaryLightColor,
        ),
      ),
      elevation: 16,
      child: ListTile(
          onTap: () {
            Get.dialog(UserDialog(user));
          },
          leading: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
              backgroundColor: ConstColors.bottom_gradient),
          title: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(StringUtils.capitalize(user.name, allWords: true),
                style: TextStyle(
                    color: ConstColors.kPrimaryLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
          subtitle: Row(
            children: [
              Text(StringUtils.capitalize(user.city, allWords: true),
                  style: TextStyle(
                      color: ConstColors.kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text('\t\t\t(${user.stock})',
                  style: TextStyle(
                      color: ConstColors.kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ],
          ),
          trailing: Text('${user.stockStatus}',
              style: TextStyle(
                  color: ConstColors.kPrimaryLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18))),
    );
  }
}
