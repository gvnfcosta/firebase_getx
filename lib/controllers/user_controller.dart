import 'package:cadastro_firebase_getx/views/auth_view.dart';
import 'package:cadastro_firebase_getx/views/main_view.dart';
import 'package:cadastro_firebase_getx/views/register_datails_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  var user = Rxn<User?>();
  var userName = ''.obs;
  var userAddress = ''.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
    ever(user, _setUserData);
  }

  void _setUserData(User? user) async {
    if (user != null) {
      DocumentSnapshot doc =
          await firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        userName.value = doc['name'] ?? '';
        userAddress.value = doc['address'] ?? '';
      } else {
        userName.value = '';
        userAddress.value = '';
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _checkUserInfo();
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  void _checkUserInfo() {
    if (userName.value.isEmpty || userAddress.value.isEmpty) {
      Get.off(RegisterDetailsView());
    } else {
      Get.off(MainView());
    }
  }

  Future<void> saveUserData(String name, String address) async {
    await firestore.collection('users').doc(user.value!.uid).set({
      'name': name,
      'address': address,
    });
    userName.value = name;
    userAddress.value = address;
    Get.off(MainView());
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.off(AuthView());
  }
}
