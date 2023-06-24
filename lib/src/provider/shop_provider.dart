import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/services/shop_service.dart';

import '../models/shop_model.dart';

List<ShopModel> _shopList = [];

class ShopProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ShopService _shopService = ShopService();

  List<ShopModel> get getShopList => _shopList;

  listenShopList() {
    if (_shopList.isEmpty) {
      _firestore.collection("shops").snapshots().listen((snapshots) {
        final data = snapshots.docs;

        _shopList = data.map<ShopModel>((doc) {
          return ShopModel(
            id: doc.id,
            name: doc['name'],
            address: doc['address'],
          );
        }).toList();

        if (snapshots.docChanges.isNotEmpty) {
          notifyListeners();
        }
      });
    }
  }

  Future<String> createShop({
    required String name,
    required String address,
  }) async {
    String response =
        await _shopService.createShop(name: name, address: address);

    notifyListeners();

    return response;
  }

  Future<String> editShop(ShopModel shopModel) async {
    String response = await _shopService.editShop(shopModel);

    notifyListeners();

    return response;
  }

  Future<String> deleteShop(String shopId) async {
    String response = await _shopService.deleteShop(shopId);

    notifyListeners();

    return response;
  }
}
