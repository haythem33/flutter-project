import 'package:flutter/material.dart';
import 'package:frontend/services/utility/dialog.dart';
import 'package:frontend/models/Famille.dart';
import 'package:frontend/services/family/familyservice.dart';

class AddFamily extends StatelessWidget {
  const AddFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ADD FAMILY"),
        ),
        body: const MyFamilyState());
  }
}

class MyFamilyState extends StatefulWidget {
  const MyFamilyState({Key? key}) : super(key: key);
  @override
  State<MyFamilyState> createState() => _MyFamilyState();
}

class _MyFamilyState extends State<MyFamilyState> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nomFamille;

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
                nomFamille = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('add'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final bool state =
                    await familyservice.add(Famille.instance(nomFamille));
                if (state) {
                  await MyDialog.fullDialog(context, "FAMILY ADDED ");
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
