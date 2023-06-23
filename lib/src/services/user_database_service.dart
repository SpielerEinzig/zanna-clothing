import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zannas_clothing/src/models/user_model.dart';

class DatabaseService {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection("users");

  Future<String> createUserDoc(UserModel userModel) async {
    try {
      await _firestore.doc(userModel.userId).set({
        "email": userModel.email,
        "userId": userModel.userId,
        "username": userModel.username,
        "shopId": userModel.shopId
      });

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> editUserDoc(UserModel userModel) async {
    try {
      await _firestore.doc(userModel.userId).set({
        "email": userModel.email,
        "userId": userModel.userId,
        "username": userModel.username,
        "shopId": userModel.shopId
      });

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }
}
