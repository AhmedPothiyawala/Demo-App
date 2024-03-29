import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/user.dart';

class UserController extends GetxController {
  final RxList<User> users = RxList<User>([]);
  final RxBool isLoading = RxBool(false);
  final RxString errorMessage = RxString('');

  Future<void> fetchUsers() async {
    isLoading(true);
    errorMessage('');
    await Future.delayed(const Duration(seconds: 5));
    for (int i = 0; i <= 43; i++) {
      users.value += [
        User(
            name: 'John$i$i Doe$i$i',
            phone: '$i$i$i$i$i$i$i$i$i',
            city: 'New York',
            imageUrl: 'https://via.placeholder.com/15$i',
            stock: i),
        // Add more users here
      ];
    }
    isLoading(false);
  }

  Future<void> updateUsers() async {
    isLoading(true);
    errorMessage('');
    for (int i = 0; i <= 43; i++) {
      users.value += [
        User(
            name: 'John$i$i Doe$i$i',
            phone: '$i$i$i$i$i$i$i$i$i',
            city: 'New York',
            imageUrl: 'https://via.placeholder.com/15$i',
            stock: i),
      ];
    }
    isLoading(false);
  }

  void searchUsers(String query) {
    if (query.isEmpty == true || query == '') {
      allUsers.value = users;
      updateUsers();
    } else {
      users.value = allUsers
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.phone.contains(query) ||
              user.city.toLowerCase().contains(query.toLowerCase()))
          .toList();
      update();
    }
    update();
  }

  Future<void> updateUserStock(User user, int newStock) async {
    await Future.delayed(const Duration(seconds: 1));
    user.stock = newStock;
    users.refresh();
    update();
  }

  void loadMoreUsers() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  final RxList<User> allUsers = RxList<User>([]);

  @override
  void onInit() async {
    super.onInit();
    allUsers.value = users;
    fetchUsers();
  }
}
