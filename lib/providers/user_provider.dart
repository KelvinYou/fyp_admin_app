import 'package:flutter/widgets.dart';
import 'package:fyp_admin_app/models/admin.dart';
import 'package:fyp_admin_app/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  AdminAccount? _user;
  final AuthMethods _authMethods = AuthMethods();

  AdminAccount get getUser => _user!;

  Future<void> refreshUser() async {
    AdminAccount user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}