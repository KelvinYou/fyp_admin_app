import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_admin_app/models/admin.dart' as model;
import 'package:fyp_admin_app/resources/firestore_methods.dart';
import 'package:fyp_admin_app/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.AdminAccount> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
    await _firestore.collection('tourGuides').doc(currentUser.uid).get();

    return model.AdminAccount.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        //
        model.AdminAccount _user = model.AdminAccount(
          uid: cred.user!.uid,
          username: username,
          email: email,
        );

        // // adding user in our database
        await _firestore
            .collection("admins")
            .doc(cred.user!.uid)
            .set(_user.toJson());

      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      String errorMsg = err.toString();
      res = capitalize(
          errorMsg.substring(errorMsg.indexOf('/'),
              errorMsg.indexOf(']')).replaceAll(RegExp(r'/'), '').replaceAll(RegExp(r'-'), ' ')
      );
    }
    return res;
  }

  String capitalize(String string) {
    return "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      String errorMsg = err.toString();
      res = capitalize(
          errorMsg.substring(errorMsg.indexOf('/'),
              errorMsg.indexOf(']')).replaceAll(RegExp(r'/'), '').replaceAll(RegExp(r'-'), ' ')
      );
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> changePassword(String currentPassword, String newPassword) async {
    String res = "Some error Occurred";
    User user = _auth.currentUser!;

    final cred = EmailAuthProvider.credential(email: user.email ?? "", password: currentPassword);

    await user.reauthenticateWithCredential(cred).then((value) async {
      await user.updatePassword(newPassword).then((_) {
        res = "success";
      }).catchError((error) {
        res = "Some error Occurred";
      });
    }).catchError((err) {
      print(err.toString());
      res = "Wrong old password";
    });

    return res;
  }

  Future<String> changeEmail(String currentEmail, String newEmail) async {
    String res = "Some error Occurred";
    User user = _auth.currentUser!;
    //
    // final cred = EmailAuthProvider.credential(email: user.email ?? "", password: currentPassword);
    //
    // await user.reauthenticateWithCredential(cred).then((value) async {
    //   await user.updatePassword(newPassword).then((_) {
    //     res = "success";
    //   }).catchError((error) {
    //     res = "Some error Occurred";
    //   });
    // }).catchError((err) {
    //   res = "Wrong old password";
    // });

    return res;
  }
}
