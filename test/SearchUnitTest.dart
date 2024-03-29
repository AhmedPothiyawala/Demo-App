import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practicaltask/controllers/user_controller.dart';

void main() {
  test('Search list of records', () {
    final search_controller = Get.put(UserController());
    search_controller.searchUsers('John');
  });
}
