import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_admin_app/ui_view/detail/tour_guide.dart';

import 'package:fyp_admin_app/widget/image_full_screen.dart';
import 'package:intl/intl.dart';

class DatabaseCard extends StatefulWidget {
  final snap;
  final String showField;
  final String documentId;
  final VoidCallback function;
  final int index;
  const DatabaseCard({
    Key? key,
    required this.snap,
    required this.showField,
    required this.documentId,
    required this.function,
    required this.index,
  }) : super(key: key);

  @override
  State<DatabaseCard> createState() => _DatabaseCardState();
}

class _DatabaseCardState extends State<DatabaseCard> {
  @override
  void initState() {
    super.initState();
  }

  final DateFormat formatter = DateFormat('dd MMM y');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      decoration: BoxDecoration(
        color: widget.index % 2 == 0 ?
        Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.tertiaryContainer,
      ),
      child: InkWell(
          onTap: widget.function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  SizedBox(
                    width: width - 80,
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap[widget.documentId],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        widget.showField == widget.documentId ? SizedBox() :
                        Text(
                          "${widget.showField}: " + widget.snap[widget.showField],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(Icons.chevron_right),
            ],
          )
      ),
    );
  }
}
