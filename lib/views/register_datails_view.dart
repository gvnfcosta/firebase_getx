import 'package:cadastro_firebase_getx/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDetailsView extends StatelessWidget {
  final nameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Complete seu cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              onPressed: () async {
                try {
                  await userController.saveUserData(
                    nameController.text,
                    addressController.text,
                  );
                } catch (e) {
                  Get.snackbar('Erro', e.toString(),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
