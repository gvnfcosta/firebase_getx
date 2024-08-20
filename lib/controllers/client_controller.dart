import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/client_model.dart';

class ClientController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addClient(String name, String phone) async {
    try {
      await _firestore.collection('clients').add({
        'name': name,
        'phone': phone,
      });
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    }
  }

  Stream<List<ClientModel>> getClients() {
    return _firestore.collection('clients').snapshots().map((query) {
      return query.docs.map((doc) {
        return ClientModel.fromJson(doc.data());
      }).toList();
    });
  }
}
