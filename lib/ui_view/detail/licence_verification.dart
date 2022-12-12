import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_admin_app/resources/firestore_methods.dart';
import 'package:fyp_admin_app/utils/utils.dart';

import 'package:fyp_admin_app/utils/app_theme.dart';
import 'package:fyp_admin_app/widget/app_bar/secondary_app_bar.dart';
import 'package:fyp_admin_app/widget/colored_button.dart';
import 'package:fyp_admin_app/widget/delete_button.dart';
import 'package:fyp_admin_app/widget/dialogs.dart';
import 'package:intl/intl.dart';
import 'package:fyp_admin_app/widget/image_full_screen.dart';

class LicenceVerificationDetail extends StatefulWidget {
  final snap;
  const LicenceVerificationDetail({
    super.key,
    required this.snap,
  });

  @override
  State<LicenceVerificationDetail> createState() => _LicenceVerificationDetailState();
}

class _LicenceVerificationDetailState extends State<LicenceVerificationDetail> {
  bool isLoading = false;
  List<String> selectedTypes = [];

  Widget getTextWidgets(List<String> strings)
  {
    List<Widget> list = <Widget>[];
    for(var i = 0; i < strings.length; i++){
      list.add(new Text(strings[i]));
    }
    return new Row(children: list);
  }

  final DateFormat formatter = DateFormat('dd MMM y, HH:MM');

  Widget splitView(String title, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(title),
          ),
          Expanded(
            flex: 6,
            child: Text(content),
          ),
        ],
      ),
    );
  }

  int rowNum = 0;

  Widget detailRow(String title, String content) {
    setState(() {
      rowNum++;
    });

    return Container(
      decoration: BoxDecoration(
          color: rowNum % 2 == 1 ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.tertiaryContainer
      ),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Expanded(
            flex: 4,
            child: Text(title),
          ),
          Expanded(
            flex: 6,
            child: Text(content != "" ? content : "<No Data>"),
          ),
        ],
      ),
    );
  }

  delete() async {
    String res = "Some error occurred";
    try {
      FirebaseFirestore.instance.collection('bookings').doc(widget.snap["bookingId"]).delete();
      res = 'Deleted Successfully';
      showSnackBar(context, res);
      Navigator.of(context).pop();

    } catch (err) {
      res = err.toString();
    }
    showSnackBar(context, res);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    ) : Scaffold(
      appBar: SecondaryAppBar(
        title: "Licence Verification Detail",
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15,),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const Text(" Licence Verification Details"),
              detailRow("licenceId:", widget.snap["licenceId"]),
              detailRow("ownerId:", widget.snap["ownerId"]),
              DeleteButton(
                onPressed: () async {
                  final action = await Dialogs.yesAbortDialog(
                      context, 'Confirm to delete?', '',
                      'Delete');
                  if (action == DialogAction.yes) {
                    delete();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
