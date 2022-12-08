import 'package:flutter/material.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  DeleteButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          )
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
            constraints: BoxConstraints(
                maxWidth: 200.0,
                minHeight: 40.0
            ),
            alignment: Alignment.center,
            child: Text(
              "Delete",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
        ),
      ),
      splashColor: Colors.black12,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}