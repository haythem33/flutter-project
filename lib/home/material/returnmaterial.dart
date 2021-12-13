import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/materiell/materilservice.dart';
import 'package:frontend/services/utility/dialog.dart';
import 'package:frontend/models/materiel.dart';

class ReturnMaterial extends StatefulWidget {
  const ReturnMaterial({Key? key}) : super(key: key);

  @override
  State<ReturnMaterial> createState() => MyReturnMaterial();
}

class MyReturnMaterial extends State<ReturnMaterial> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nomM;
  DateTime? dateR;
  String? etat;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text correct';
                  }

                  setState(() {
                    nomM = value;
                  });
                }),
            TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter etat',
                ),
                validator: (String? value) {
                  if ((value == null || value.isEmpty) ||
                      (value != 'endommagé' &&
                          value != 'gravement endomagé' &&
                          value != 'intact')) {
                    return 'Please enter some text correct';
                  }

                  setState(() {
                    etat = value;
                  });
                }),
            ElevatedButton(
                onPressed: () async {
                  DateTime? date = await MyDialog.dateDialog(context);
                  setState(() {
                    dateR = date;
                  });
                },
                child: const Text("Date de retour")),
            ElevatedButton(
                child: const Text('ok'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    MyDialog.fullDialog(context, " SAVED");
                  } else {
                    MyDialog.fullDialog(context, " ERROR");
                  }
                }),
          ],
        ));
  }
}
