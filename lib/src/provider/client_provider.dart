import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zannas_clothing/src/services/client_service.dart';
import 'package:zannas_clothing/src/services/storage_service.dart';

import '../models/client_model.dart';

List<ClientModel> _clientList = [];

class ClientProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();
  final ClientService _clientService = ClientService();

  List<ClientModel> get getClientList => _clientList;

  List<ClientModel> searchClient(String parameter) {
    List<ClientModel> clients = [];

    for (var client in _clientList) {
      if (client.name.toLowerCase().contains(parameter) ||
          client.email.toLowerCase().contains(parameter) ||
          client.postalCode.toLowerCase().contains(parameter) ||
          client.shopId.toLowerCase().contains(parameter) ||
          client.occasion.toLowerCase().contains(parameter) ||
          client.profession.toLowerCase().contains(parameter) ||
          client.phoneNumber.toLowerCase().contains(parameter) ||
          client.address.toLowerCase().contains(parameter) ||
          client.birthday.toLowerCase().contains(parameter)) {
        clients.add(client);
      }
    }

    return clients;
  }

  List<ClientModel> getClientsInShop(String shopId) {
    List<ClientModel> clients = [];

    for (var client in _clientList) {
      if (client.shopId.toLowerCase() == shopId.toLowerCase()) {
        clients.add(client);
      }
    }

    return clients;
  }

  listenClientList() async {
    if (_clientList.isEmpty) {
      _firestore
          .collection('clients')
          .orderBy("dateAdded", descending: true)
          .snapshots()
          .listen((snapshots) {
        final data = snapshots.docs;

        _clientList = data.map<ClientModel>((doc) {
          ClientModel clientModel = ClientModel.fromJson(doc.data());

          clientModel.id = doc.id;

          return clientModel;
        }).toList();

        if (snapshots.docChanges.isNotEmpty) {
          notifyListeners();
        }
      });
    }
  }

  createClient({
    required ClientModel clientModel,
  }) async {
    String response = await _clientService.createClient(clientModel);

    notifyListeners();
    return response;
  }

  editClient(ClientModel clientModel) async {
    String response = await _clientService.editClient(clientModel);
    notifyListeners();
    return response;
  }

  deleteClient(String id) async {
    String response = await _clientService.deleteClient(id);
    notifyListeners();
    return response;
  }

  uploadImagesToClient({
    required String clientId,
    required List<XFile> selectedFiles,
  }) async {
    List<String> imageUrls = await Future.wait(selectedFiles.map((file) {
      return _storageService.uploadFile(file: file, clientId: clientId);
    }).toList());

    debugPrint("!========Uploaded file successfully");

    await _clientService.uploadClientImages(
        imageUrls: imageUrls, clientId: clientId);

    debugPrint("!========Modified doc successfully");

    notifyListeners();
  }
}
