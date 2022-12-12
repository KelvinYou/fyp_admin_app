import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_admin_app/models/instant_order.dart';
import 'package:fyp_admin_app/resources/auth_methods.dart';
import 'package:fyp_admin_app/ui_view/detail/booking.dart';
import 'package:fyp_admin_app/ui_view/detail/instant_order.dart';
import 'package:fyp_admin_app/ui_view/detail/tour_guide.dart';
import 'package:fyp_admin_app/ui_view/detail/tour_package.dart';
import 'package:fyp_admin_app/ui_view/login_view.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';
import 'package:fyp_admin_app/widget/app_bar/main_app_bar.dart';
import 'package:fyp_admin_app/widget/list_card/database_card.dart';
import 'package:fyp_admin_app/widget/loading_view.dart';
import 'package:fyp_admin_app/widget/text_field_input.dart';

class BookingsView extends StatefulWidget {
  const BookingsView({super.key});

  @override
  State<BookingsView> createState() => _BookingsViewState();
}
const List<String> list = <String>['bookingId', 'packageId', 'price', 'status', 'touristId', 'tourGuideId'];

class _BookingsViewState extends State<BookingsView> {
  bool isLoading = false;
  TextEditingController _searchController = TextEditingController();

  CollectionReference tourGuidesCollection =
  FirebaseFirestore.instance.collection('bookings');
  List<DocumentSnapshot> documents = [];

  String dropdownValue = list.first;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    // getData();

    // AuthMethods().signOut();
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) =>
    //       const Login(),
    //     )
    // );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Bookings"),
      body: isLoading ? LoadingView() : Container(
        // width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Search By: ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.expand_circle_down,
                      color: AppTheme.primary,
                    ),
                    elevation: 16,
                    style: const TextStyle(
                      color: AppTheme.primary,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.lightBlueAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                      print(dropdownValue);
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.substring(0,1).toUpperCase() + value.substring(1)),
                      );
                    }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              TextFieldInput(
                textEditingController: _searchController,
                hintText: "Search",
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                textInputType: TextInputType.text,
                iconData: Icons.search_outlined,
              ),
              const SizedBox(height: 10),

              Expanded(
                child: StreamBuilder(
                  stream: tourGuidesCollection
                      .snapshots(),
                  builder: (context, streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      documents = streamSnapshot.data!.docs;
                      //todo Documents list added to filterTitle
                      documents = documents.where((element) {
                        return element
                            .get(dropdownValue)
                            .contains(searchText);
                      }).toList();
                    }
                    return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (ctx, index) =>
                          Container(
                            child: DatabaseCard(
                              snap: documents[index].data(),
                              showField: dropdownValue,
                              documentId: "bookingId",
                              function: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BookingDetail(
                                    snap: documents[index].data(),
                                  ),
                                ),
                              ),
                              index: index,
                            ),
                          ),
                    );
                  },
                ),
              ),

            ],
          )
      ),
    );
  }
}