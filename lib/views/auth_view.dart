import 'package:cadastro_firebase_getx/controllers/user_controller.dart';
import 'package:cadastro_firebase_getx/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_view.dart';

class AuthView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await userController.login(
                      emailController.text, passwordController.text);
                  Get.off(
                      MainView()); // Redireciona para a tela principal após o login
                } catch (e) {
                  Get.snackbar('Erro', e.toString(),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.to(RegisterView()); // Redireciona para a tela de registro
              },
              child: Text('Não tem uma conta? Registre-se'),
            ),
          ],
        ),
      ),
    );
  }
}
