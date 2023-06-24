import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zannas_clothing/src/models/shop_model.dart';

class ShopService {
  final _shopCollection = FirebaseFirestore.instance.collection("shops");

  Future<String> createShop({
    required String name,
    required String address,
  }) async {
    try {
      await _shopCollection.doc().set({"name": name, "address": address});

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> editShop(ShopModel shopModel) async {
    try {
      await _shopCollection
          .doc(shopModel.id)
          .update({"name": shopModel.name, "address": shopModel.address});

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> deleteShop(String id) async {
    try {
      await _shopCollection.doc(id).delete();

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }
}
