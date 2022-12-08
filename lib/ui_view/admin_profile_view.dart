import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_admin_app/resources/auth_methods.dart';
import 'package:fyp_admin_app/ui_view/login_view.dart';
import 'package:fyp_admin_app/utils/utils.dart';
import 'package:fyp_admin_app/widget/app_bar/main_app_bar.dart';
import 'package:fyp_admin_app/widget/loading_view.dart';
import 'package:fyp_admin_app/widget/dialogs.dart';
import 'package:fyp_admin_app/widget/main_container.dart';
class AdminProfileView extends StatefulWidget {
  const AdminProfileView({super.key});

  @override
  State<AdminProfileView> createState() => _AdminProfileViewState();
}

class _AdminProfileViewState extends State<AdminProfileView> {
  bool isLoading = false;
  var userData = {};
  @override
  void initState() {
    super.initState();
    getData();


  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('admins')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = userSnap.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  logout() async {
    AuthMethods().signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
          const Login(),
        )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Admin Profile"),
      body: isLoading ? LoadingView() : Container(
        // width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              MainContainer(
                needPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Admin Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Username: " + userData['username'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Email: " + userData['email'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              GestureDetector(
                onTap: () async {
                  final action = await Dialogs.yesAbortDialog(
                      context, 'Confirm to logout?', '',
                      'Logout');
                  if (action == DialogAction.yes) {
                    logout();
                  }
                },
                child: MainContainer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}