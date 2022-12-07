import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:fyp_admin_app/main.dart';
import 'package:fyp_admin_app/ui_view/admin_chatroom_view.dart';
import 'package:fyp_admin_app/ui_view/admin_home_view.dart';
import 'package:fyp_admin_app/ui_view/admin_profile_view.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomBarView extends StatefulWidget {
  final int selectedIndex;
  const BottomBarView({super.key, required this.selectedIndex});

  @override
  State<BottomBarView> createState() => _MyBottomBarView();
}

class _MyBottomBarView extends State<BottomBarView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static List<Widget> _widgetOptions = <Widget>[
    AdminHomeView(),
    AdminChatroomView(),
    AdminProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppTheme.primary,
        onTap: _onItemTapped,
      ),

    );
  }
}
