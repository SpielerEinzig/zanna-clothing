import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zannas_clothing/src/models/client_model.dart';

class ClientService {
  final _clientCollection = FirebaseFirestore.instance.collection('clients');

  Future<String> createClient(ClientModel clientModel) async {
    try {
      _clientCollection.doc().set(clientModel.toJson());

      return "Success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> editClient(ClientModel clientModel) async {
    try {
      _clientCollection.doc(clientModel.id).update(clientModel.toJson());

      return "Success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> deleteClient(String id) async {
    try {
      _clientCollection.doc(id).delete();

      return "Success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> uploadClientImages({
    required List<String> imageUrls,
    required String clientId,
  }) async {
    try {
      await _clientCollection.doc(clientId).update({
        "images": FieldValue.arrayUnion(imageUrls),
      });

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? "An error occurred";
    }
  }
}
