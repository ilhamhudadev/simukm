import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

Future<void> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('user_email');
  prefs.remove('is_logged_in');
}

bool get isLoggedIn {
  final SharedPreferences prefs =
      SharedPreferences.getInstance() as SharedPreferences;
  return prefs.getBool('is_logged_in') ?? false;
}

Future<String> isUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_id') ?? "";
}

String userId = "";

Future<String> selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }

  // Format tanggal menggunakan paket intl
  // String formattedDate =
  //     DateFormat('dd MMMM yyyy', 'id_ID').format(selectedDate);
  String formattedDate = DateFormat('dd MMMM yyyy').format(selectedDate);
  print("formatted data : $formattedDate");
  return formattedDate.toString();
}
