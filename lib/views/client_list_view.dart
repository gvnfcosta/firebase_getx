import 'package:cadastro_firebase_getx/controllers/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/client_model.dart';

class ClientListView extends StatelessWidget {
  final ClientController clientController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Clientes")),
      body: StreamBuilder<List<ClientModel>>(
        stream: clientController.getClients(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              ClientModel client = snapshot.data![index];
              return ListTile(
                title: Text(client.name!),
                subtitle: Text(client.phone!),
              );
            },
          );
        },
      ),
    );
  }
}
