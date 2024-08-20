import 'package:cadastro_firebase_getx/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              userController.logout();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (userController.user.value == null) {
          return Center(child: Text('Por favor, faça login.'));
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
