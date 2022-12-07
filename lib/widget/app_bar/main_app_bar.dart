import 'package:flutter/material.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final IconData? rightButton;
  final VoidCallback? function;
  const MainAppBar({
    Key? key,
    required this.title,
    this.rightButton,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: <Color>[
      //         Theme.of(context).colorScheme.primary,
      //         Theme.of(context).colorScheme.secondary,
      //       ],
      //     ),
      //   ),
      // ),
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
