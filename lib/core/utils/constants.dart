import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showToast({required String message,
    required Toast toastLength,
    required ToastGravity gravity,
    required Color backgroundColor,
    required Color textColor,
    required double fontSize}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  static void showCupertinoDialog({required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    required String cancelActionText,
    required Function defaultAction,
    required Function cancelAction}) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  cancelAction();
                },
                child: Text(cancelActionText),
              ),
              TextButton(
                onPressed: () {
                  defaultAction();
                },
                child: Text(defaultActionText),
              ),
            ],
          );
        });
  }
}
