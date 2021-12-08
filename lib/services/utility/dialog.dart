import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/models/membre.dart';
import 'package:frontend/services/materiell/materilservice.dart';

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

  static Future<void> detailMaterial(BuildContext context, Materiel mat) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Detail : " + mat.nomMateriel!),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 16,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("family name :" + mat.nomF!,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey)),
                    Text("Quantity : " + mat.quantite.toString(),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey)),
                    Text("dateAcquition : " + mat.dateAcqui.toString(),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey))
                  ],
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

  static Future<void> borrowMaterialForm(BuildContext context, Materiel mat) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? firstName;
    String? lastName;
    String? phoneNumber;
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter First Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your first name';
                          }
                          firstName = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Last Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your last name';
                          }
                          lastName = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Phone number',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your phone number';
                          }
                          phoneNumber = value;
                        },
                      ),
                    ],
                  )),
              title: Text('Borrow :' + mat.nomMateriel!),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Materielservice.borrowMaterial(
                          Member(
                              firstName: firstName,
                              lastName: lastName,
                              phoneNumber: int.parse(phoneNumber!)),
                          mat);
                    }
                  },
                  child: const Text('Borrow'),
                ),
              ],
            );
          });
        });
  }
}
