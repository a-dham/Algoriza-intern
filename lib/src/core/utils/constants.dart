import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_1/src/core/utils/app_colors.dart';

class Constants {
  static void showErrorDialog(context, msg) {
    showDialog(
        context: context,
        builder: (context) =>
            CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: 17,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      primary: AppColors.kBlackColor,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  static void showToast({

    required String msg,
    Color? color,
    ToastGravity? toastGravity,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: color ?? AppColors.kWhiteColor,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
      );
}
