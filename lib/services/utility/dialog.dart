import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialog {
  static Future<void> fullDialog(BuildContext context, String message) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("MESSAGE"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 16,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[Text(message)],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('OK'),
                ),
              ]);
        });
  }

  static Future<DateTime?> dateDialog(BuildContext context) {
    return showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          confirmText: "Procced",
        );
      },
    );
  }
}
