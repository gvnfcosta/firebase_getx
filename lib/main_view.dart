import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';
import 'register_view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Obx(() {
        if (userController.user.value == null) {
          return Center(child: Text('Por favor, faça login.'));
        } else if (userController.userName.value.isEmpty ||
            userController.userAddress.value.isEmpty) {
          return RegisterView();
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nome: ${userController.userName.value}'),
                Text('Endereço: ${userController.userAddress.value}'),
              ],
            ),
          );
        }
      }),
    );
  }
}
