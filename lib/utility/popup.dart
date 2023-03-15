import 'package:flutter/material.dart';
import 'package:stock_tracker/utility/colors/colors.dart';

class AppPopup {
  static popup(BuildContext context, String text, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Text(text),
        backgroundColor: color,
      ),
    );
  }

  static success(BuildContext context, {String? title}) {
    popup(context, title ?? 'Successfull', color: AppColors.success);
  }

  static error(BuildContext context, {String? title}) {
    popup(context, title ?? 'Something went wrong', color: AppColors.error);
  }
}
