import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicaltask/custome%20function/Colors/constants.dart';
import '../controllers/exit_controller.dart';
import '../custome function/Custome_Strings/heading.dart';
import 'Widgets/shimmer.dart';
import 'user_item.dart';
import '../controllers/user_controller.dart';

class HomeScreen extends GetView<UserController> {
  final home_controller = Get.put(UserController());
  final exitConfirmationController = Get.put(ExitConfirmationController());
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitConfirmationController.showExitConfirmation(),
      child: Scaffold(
        backgroundColor: ConstColors.bottom_gradient,
        appBar: AppBar(
          backgroundColor: ConstColors.bottom_gradient,
          title: Text(Heading.dashboard,
              style: TextStyle(
                  color: ConstColors.kPrimaryLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (value) => controller.searchUsers(value),
                decoration: InputDecoration(
                  hintText: Heading.search_hint,
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: GetX<UserController>(
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return ShimmerEffect();
                  } else if (controller.users.length <= 0) {
                    return Text(Heading.no_data,
                        style: TextStyle(
                            color: ConstColors.kPrimaryLightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24));
                  } else {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        if (index >= controller.users.length - 5) {
                          controller.loadMoreUsers();
                        }
                        return UserItem(user: controller.users[index]);
                      },
                      physics: const AlwaysScrollableScrollPhysics(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
