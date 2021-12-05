import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/services/materiell/materilservice.dart';
import 'package:frontend/services/utility/dialog.dart';

class AddMaterial extends StatelessWidget {
  const AddMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ADD MATERIEL"),
        ),
        body: const MymatState());
  }
}

class MymatState extends StatefulWidget {
  const MymatState({Key? key}) : super(key: key);
  @override
  State<MymatState> createState() => _MymatState();
}

class _MymatState extends State<MymatState> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nomMateriel;
  int? qnt;
  DateTime? dateA;
  DateTime? dateR;
  String? nomF;

  get materiel => null;

  DateTime? get dateAcqui => null;

  DateTime? get dateRetour => null;

  int? get quantite => null;

  @override
  Widget build(BuildContext mycontext) {
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
                return 'Please enter some text';
              }

              setState(() {
                nomMateriel = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter quantite',
            ),
            validator: (String? value) {
              if (value == null) {
                return 'Please enter some text';
              }

              setState(() {
                qnt = value as int?;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter date',
            ),
            validator: (String? value) {
              if (value == null) {
                return 'Please enter some text';
              }

              setState(() {
                dateA = value as DateTime?;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter date',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              setState(() {
                dateR = value as DateTime?;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter name family',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              setState(() {
                nomF = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('add'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final bool state = await materielservice.add(Materiel.instance(
                    nomMateriel, quantite, dateAcqui, dateRetour, nomF));
                if (state) {
                  await MyDialog.fullDialog(context, "MATERIEL ADDED ");
                  return;
                }
                await MyDialog.fullDialog(context, "BAD INFORMATION");
              }
            },
          ),
        ],
      ),
    );
  }
}
