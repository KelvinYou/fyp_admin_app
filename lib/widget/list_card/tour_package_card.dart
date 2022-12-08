import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_admin_app/ui_view/detail/tour_guide.dart';

import 'package:fyp_admin_app/widget/image_full_screen.dart';
import 'package:intl/intl.dart';

class TourPackageCard extends StatefulWidget {
  final snap;
  final String showField;
  final int index;
  const TourPackageCard({
    Key? key,
    required this.snap,
    required this.showField,
    required this.index,
  }) : super(key: key);

  @override
  State<TourPackageCard> createState() => _TourPackageCardState();
}

class _TourPackageCardState extends State<TourPackageCard> {
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
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TourGuideDetail(
                tourGuideDetailSnap: widget.snap,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width - 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap['uid'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        widget.showField == "uid" ? SizedBox() :
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
