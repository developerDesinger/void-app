

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:voidapp/app/config/app_colors.dart';


class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getIconPath(String name, {String format = 'png'}) {
    return 'assets/icons/$name.$format';
  }

  static String convertDateToString(DateTime date, {String? format}) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static Future<String?> selectDate(BuildContext context,TextEditingController controller) async{
    String? convertedDate;
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
        convertedDate=  convertDateToString(pickedDate);
      final formattedDate = DateFormat('d MMMM yyyy').format(pickedDate);


      controller.text = formattedDate;
    }
    return convertedDate;
  }


  static void selectTime(BuildContext context, TextEditingController controller)async{
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      final dateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      final formattedTime = DateFormat.jm().format(dateTime);

      // Adjust timezone if needed
      final formattedTimeWithTimezone = formattedTime;

      controller.text = formattedTimeWithTimezone;
    }
  }


  static String getSvgPath(String name, {String format = 'svg'}) {
    return 'assets/svgIcons/$name.$format';
  }

  static String getProfilePath(String name, {String format = 'png'}) {
    return 'assets/icons/profile_icons/$name.$format';
  }

  static showToast({required String message, int time = 2}) {
    Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: time,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }



}
