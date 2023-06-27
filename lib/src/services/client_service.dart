import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zannas_clothing/src/models/client_model.dart';

class ClientService {
  final _clientCollection = FirebaseFirestore.instance.collection('clients');

  Future<String> createClient(ClientModel clientModel) async {
    try {
      await _clientCollection.doc().set(clientModel.toJson());

      return "Success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> editClient(ClientModel clientModel) async {
    try {
      await _clientCollection.doc().update(clientModel.toJson());

      return "Success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> deleteClient(String id) async {
    try {
      await _clientCollection.doc(id).delete();

      return "Success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }
}
