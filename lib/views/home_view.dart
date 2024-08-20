import 'package:cadastro_firebase_getx/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_client_view.dart';
import 'client_list_view.dart';

class HomeView extends StatelessWidget {
  final AuthController authController = Get.find(); // Encontra o AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => authController.signOut(), // Função de logout
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(
                  RegisterClientView()), // Navega para a tela de cadastro de clientes
              child: Text("Cadastrar Cliente"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                  ClientListView()), // Navega para a tela de listagem de clientes
              child: Text("Listar Clientes"),
            ),
          ],
        ),
      ),
    );
  }
}
