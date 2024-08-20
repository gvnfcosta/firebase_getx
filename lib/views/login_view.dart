import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'signup_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.find(); // Aqui o AuthController é encontrado

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.login(
                    emailController.text, passwordController.text);
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Get.to(SignUpView()),
              child: Text("Não tem uma conta? Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}
