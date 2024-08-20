import 'package:cadastro_firebase_getx/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  final nameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userController.saveUserData(
                    nameController.text, addressController.text);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
