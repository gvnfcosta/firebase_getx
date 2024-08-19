import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';
import 'main_view.dart';

class RegisterView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
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
                  await userController.register(
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                    addressController.text,
                  );
                  Get.off(
                      MainView()); // Redireciona para a tela principal após o registro
                } catch (e) {
                  Get.snackbar('Erro', e.toString(),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
