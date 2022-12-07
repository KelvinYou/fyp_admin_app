import 'package:flutter/material.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';

class SecondaryAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final IconData? rightButton;
  final VoidCallback? function;

  const SecondaryAppBar({
    Key? key,
    required this.title,
    this.rightButton,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   onPressed: () => Navigator.of(context).pop(context),
      // ),
      iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(
          title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      elevation: 0,
      actions: <Widget>[
        rightButton != null && function != null ?
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: function,
              child: Icon( rightButton ),
            )
        ) : const SizedBox(),
      ],
    );

  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
