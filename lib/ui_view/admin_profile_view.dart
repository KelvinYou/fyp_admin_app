import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_admin_app/resources/auth_methods.dart';
import 'package:fyp_admin_app/ui_view/login_view.dart';
import 'package:fyp_admin_app/widget/app_bar/main_app_bar.dart';
import 'package:fyp_admin_app/widget/loading_view.dart';

class AdminProfileView extends StatefulWidget {
  const AdminProfileView({super.key});

  @override
  State<AdminProfileView> createState() => _AdminProfileViewState();
}

class _AdminProfileViewState extends State<AdminProfileView> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // getData();

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
              Text("Profile")
            ],
          ),
        ),

      ),
    );
  }
}