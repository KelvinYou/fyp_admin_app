import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_admin_app/ui_view/database/bookings.dart';
import 'package:fyp_admin_app/ui_view/database/ic_verifications.dart';
import 'package:fyp_admin_app/ui_view/database/instant_orders.dart';
import 'package:fyp_admin_app/ui_view/database/licence_verification.dart';
import 'package:fyp_admin_app/ui_view/database/tour_guides.dart';
import 'package:fyp_admin_app/ui_view/database/tour_packages.dart';
import 'package:fyp_admin_app/ui_view/database/transactions.dart';
import 'package:fyp_admin_app/widget/app_bar/main_app_bar.dart';
import 'package:fyp_admin_app/widget/loading_view.dart';
import 'package:fyp_admin_app/widget/main_container.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';

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

  Widget selectionView(IconData icon, String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),

          Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget selectionViewNoIcon(String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),

          Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget mainTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
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
              const SizedBox(height: 20),
              MainContainer(
                  child: Column(
                    children: [
                      mainTitle("Verification Request"),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const IcVerificationsView(),
                          ),
                        ),
                        child: selectionView(
                            Icons.person_pin_circle_outlined,
                            "IC Verification"
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LicenceVerificationsView(),
                          ),
                        ),
                        child: selectionView(
                            Icons.approval_outlined,
                            "Licence Verification"
                        ),
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 20),
              MainContainer(
                  child: Column(
                    children: [
                      mainTitle("Database"),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TourGuidesView(),
                          ),
                        ),
                        child: selectionViewNoIcon(
                            "Tour Guides"
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TourPackagesView(),
                          ),
                        ),
                        child: selectionViewNoIcon(
                            "Tour Packages"
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const InstantOrdersView(),
                          ),
                        ),
                        child: selectionViewNoIcon(
                            "Instant Orders"
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const BookingsView(),
                          ),
                        ),
                        child: selectionViewNoIcon(
                            "Bookings"
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: AppTheme.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TransactionsView(),
                          ),
                        ),
                        child: selectionViewNoIcon(
                            "Transactions"
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),

      ),
    );
  }
}