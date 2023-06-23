import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/models/user_model.dart';
import 'package:zannas_clothing/src/services/auth_service.dart';
import 'package:zannas_clothing/src/services/user_database_service.dart';

User? _user;
UserModel? _userModel;

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();
  final AuthService _authService = AuthService();

  User? get getCurrentUser => _user;
  UserModel? get getUserModel => _userModel;

  getUser() async {
    if (_user != null) {
      await _user!.reload();
    } else {
      _user = _firebaseAuth.currentUser;
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    String response = await _authService.createUserWithEmailAndPassword(
        email: email, password: password);

    if (response == "success") {
      await getUser();
      if (_user != null) {
        await _databaseService.createUserDoc(
          UserModel(
              username: 'username',
              email: _user!.email!,
              userId: _user!.uid,
              shopId: 'shopId'),
        );

        listenUserAuthDetails();
        listenUserDocument();
      }

      notifyListeners();
    }

    return response;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String response = await _authService.loginUserWithEmailAndPassword(
        email: email, password: password);

    if (response == "success") {
      await getUser();
      if (_user != null) {
        listenUserAuthDetails();
        listenUserDocument();
      }

      notifyListeners();
    }

    return response;
  }

  listenUserAuthDetails() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      _user = user;

      // if (user != null && _userModel == null) {
      //   debugPrint("Fetching user doc");
      //   UserModel? userData = await _databaseService.getUser(
      //     email: user.email!,
      //     userId: getUserAuthDetail!.uid,
      //   );
      //
      //   if (userData != null) {
      //     debugPrint("Set user doc");
      //     _userModel = userData;
      //     notifyListeners();
      //   }
      // }
    });
  }

  listenUserDocument() async {
    if (_user != null && _userModel == null) {
      _firestore.collection("users").doc(_user!.uid).snapshots().listen((doc) {
        final userDoc = doc.data();

        if (userDoc != null) {
          _userModel = UserModel(
            username: userDoc['username'],
            email: userDoc['email'],
            userId: userDoc['userId'],
            shopId: userDoc['shopId'],
          );
        }
      });
    }
  }
}
