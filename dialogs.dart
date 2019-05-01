import 'dart:io';
import 'package:broom/common/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ActionStyle { normal, destructive, important, important_destructive }

class Dialogs {

  /// show the OS Native dialog
  static showOSDialog(BuildContext context, String title, String message,
      String firstButtonText, Function firstCallBack,
      {ActionStyle firstActionStyle = ActionStyle.normal,
      String secondButtonText,
      Function secondCallback,
      ActionStyle secondActionStyle = ActionStyle.normal}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return _iosDialog(
              context, title, message, firstButtonText, firstCallBack,
              firstActionStyle: firstActionStyle,
              secondButtonText: secondButtonText,
              secondCallback: secondCallback,
              secondActionStyle: secondActionStyle);
        } else {
          return _androidDialog(
              context, title, message, firstButtonText, firstCallBack,
              firstActionStyle: firstActionStyle,
              secondButtonText: secondButtonText,
              secondCallback: secondCallback,
              secondActionStyle: secondActionStyle);
        }
      },
    );
  }

  /// show the android Native dialog
  static Widget _androidDialog(BuildContext context, String title,
      String message, String firstButtonText, Function firstCallBack,
      {ActionStyle firstActionStyle = ActionStyle.normal,
      String secondButtonText,
      Function secondCallback,
      ActionStyle secondActionStyle = ActionStyle.normal}) {
    List<FlatButton> actions = [];
    actions.add(FlatButton(
      child: Text(
        firstButtonText,
        style: TextStyle(
            color: (firstActionStyle == ActionStyle.important_destructive ||
                    firstActionStyle == ActionStyle.destructive)
                ? AppColors.red
                : AppColors.darkText,
            fontWeight:
                (firstActionStyle == ActionStyle.important_destructive ||
                        firstActionStyle == ActionStyle.important)
                    ? FontWeight.bold
                    : FontWeight.normal),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        firstCallBack();
      },
    ));

    if (secondButtonText != null) {
      actions.add(FlatButton(
        child: Text(secondButtonText,
            style: TextStyle(
                color:
                    (secondActionStyle == ActionStyle.important_destructive ||
                            firstActionStyle == ActionStyle.destructive)
                        ? AppColors.red
                        : AppColors.darkText)),
        onPressed: () {
          Navigator.of(context).pop();
          secondCallback();
        },
      ));
    }

    return AlertDialog(
        title: Text(title), content: Text(message), actions: actions);
  }

  /// show the iOS Native dialog
  static Widget _iosDialog(BuildContext context, String title, String message,
      String firstButtonText, Function firstCallback,
      {ActionStyle firstActionStyle = ActionStyle.normal,
      String secondButtonText,
      Function secondCallback,
      ActionStyle secondActionStyle = ActionStyle.normal}) {
    List<CupertinoDialogAction> actions = [];
    actions.add(
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop();
          firstCallback();
        },
        child: Text(firstButtonText,
            style: TextStyle(
            color: (firstActionStyle == ActionStyle.important_destructive ||
                    firstActionStyle == ActionStyle.destructive)
                ? AppColors.red
                : AppColors.darkText,
            fontWeight:
                (firstActionStyle == ActionStyle.important_destructive ||
                        firstActionStyle == ActionStyle.important)
                    ? FontWeight.bold
                    : FontWeight.normal),
      ),
      ),
    );

    if (secondButtonText != null) {
      actions.add(
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
            secondCallback();
          },
          child: Text(secondButtonText,
              style: TextStyle(
            color: (secondActionStyle == ActionStyle.important_destructive ||
                    secondActionStyle == ActionStyle.destructive)
                ? AppColors.red
                : AppColors.darkText,
            fontWeight:
                (secondActionStyle == ActionStyle.important_destructive ||
                        secondActionStyle == ActionStyle.important)
                    ? FontWeight.bold
                    : FontWeight.normal),
      ),
        ),
      );
    }

    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: actions,
    );
  }
}
