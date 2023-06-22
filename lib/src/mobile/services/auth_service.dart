import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'failure';
    }
  }

  Future<String> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? 'failure';
    }
  }

  Future<String> confirmUser(User userAuthDetail) async {
    try {
      await userAuthDetail.sendEmailVerification();

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'failure';
    }
  }

  Future<String> changeEmail({required String newEmail}) async {
    try {
      final userAuthDetail = _firebaseAuth.currentUser;

      if (userAuthDetail != null) {
        await userAuthDetail.updateEmail(newEmail);

        return 'success';
      } else {
        return 'user is not authenticated';
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'failure';
    }
  }

  Future<String> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred with this service.';
    }
  }

  Future<String> logoutUser() async {
    try {
      await _firebaseAuth.signOut();

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'failure';
    }
  }

  Future<String> deleteUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = _firebaseAuth.currentUser;

      if (user != null) {
        await user.delete();
      }

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'failure';
    }
  }
}
