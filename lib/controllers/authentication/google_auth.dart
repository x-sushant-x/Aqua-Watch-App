// ignore_for_file: unrelated_type_equality_checks

import 'package:aqua_watch_app/controllers/authentication/api.dart';
import 'package:aqua_watch_app/controllers/dialogs/dialog_controller.dart';
import 'package:aqua_watch_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

final authAPIController = Get.put(AuthAPIController());
final dialogController = Get.put(DialogsController());

Future<User?> signUpWithGoogle(String location, language, phoneNumber) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user!.displayName == null ||
          user.email == null ||
          user.photoURL == null) {
        dialogController.showErrorDialog('Google auth failed.');
        return null;
      }

      bool userAuthenticated = await authAPIController.addUserToDB(
          user.displayName ?? '',
          user.email,
          location,
          language,
          user.photoURL,
          phoneNumber);

      userAuthenticated
          ? Get.offAll(MyHomePage())
          : dialogController.showErrorDialog('Google auth failed');

      return user;
    }
  } catch (error) {
    print("Error signing in with Google: $error");
  }
}

Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user!.displayName == null ||
          user.email == null ||
          user.photoURL == null) {
        dialogController.showErrorDialog('Google auth failed.');
        return null;
      }

      bool userAuthenticated =
          await authAPIController.loginFromDB(user.email ?? '');

      userAuthenticated
          ? Get.offAll(MyHomePage())
          : dialogController.showErrorDialog('Google auth failed');

      return user;
    }
  } catch (error) {
    print("Error signing in with Google: $error");
  }
}

Future<User?> signUpNGOWithGoogle(String name, location, phoneNumber, description) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user!.displayName == null ||
          user.email == null ||
          user.photoURL == null) {
        dialogController.showErrorDialog('Google auth failed.');
        return null;
      }

      bool userAuthenticated = await authAPIController.addNGOToDB(
          name,
          user.email,
          location,
          user.photoURL,
          phoneNumber,
          description);

      userAuthenticated
          ? Get.offAll(MyHomePage())
          : dialogController.showErrorDialog('Google auth failed');

      return user;
    }
  } catch (error) {
    print("Error signing in with Google: $error");
    return null;
  }
  return null;
}

Future<User?> signInNGOWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user!.displayName == null ||
          user.email == null) {
        dialogController.showErrorDialog('Google auth failed.');
        return null;
      }

      bool userAuthenticated =
          await authAPIController.loginNGOFromDB(user.email ?? '');

      userAuthenticated
          ? Get.offAll(MyHomePage())
          : dialogController.showErrorDialog('Login Failed');

      return user;
    }
  } catch (error) {
    print("Error signing in with Google: $error");
  }
  return null;
}