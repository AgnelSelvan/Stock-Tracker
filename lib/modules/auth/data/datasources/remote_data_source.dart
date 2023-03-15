import 'dart:developer';

import 'package:firedart/auth/exceptions.dart';
import 'package:firedart/firedart.dart';
import 'package:stock_tracker/modules/auth/data/models/user.dart';

abstract class AuthRDS {
  Future<AppUserModel?> login(String email, String password);
}

class AuthRDSImpl implements AuthRDS {
  @override
  Future<AppUserModel?> login(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.signIn(email, password);
      final docData =
          await Firestore.instance.collection('users').document(user.id).get();
      log("User Data: ${docData.map}");
      return null;
    } on AuthException catch (error) {
      String errorMessage;

      switch (error.errorCode) {
        case "INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = error.errorCode;
      }
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
