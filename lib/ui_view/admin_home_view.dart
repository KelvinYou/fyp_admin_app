import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_admin_app/widget/app_bar/main_app_bar.dart';
import 'package:fyp_admin_app/widget/loading_view.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Admin Home"),
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
              Text("Home")
            ],
          ),
        ),

      ),
    );
  }
}