import 'package:flutter/material.dart';

enum DialogAction { yes, abort }
enum DialogSelection { first, second }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
      BuildContext context,
      String title,
      String body,
      String btnText,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: body != "" ? Text(body) : SizedBox(),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              child: Text(
                btnText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }

  static Future<DialogSelection> selectionAbortDialog(
      BuildContext context,
      String title,
      String body,
      String btnText,
      String btn2Text,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: body != "" ? Text(body) : SizedBox(),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => Navigator.of(context).pop(DialogSelection.second),
              child: Text(
                btnText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => Navigator.of(context).pop(DialogSelection.first),
              child: Text(
                btn2Text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogSelection.second;
  }
}