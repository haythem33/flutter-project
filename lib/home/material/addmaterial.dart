import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/famille.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/services/materiell/materilservice.dart';
import 'package:frontend/services/utility/dialog.dart';
import 'package:frontend/services/family/familyservice.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({Key? key}) : super(key: key);
  @override
  State<AddMaterial> createState() => _MymatState();
}

class _MymatState extends State<AddMaterial> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nomMateriel;
  int? qnt;
  DateTime? dateA;
  DateTime? dateR;
  String? nomF;
  List<Famille>? allFamily;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext mycontext) {
    return Form(
        key: _formKey,
        child: FutureBuilder<List<Famille>>(
          future: Familyservice.getAllFamily(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Famille>> snapshot) {
            Widget children;
            if (snapshot.hasData) {
              children = DropdownButton<String>(
                  items: snapshot.data!.map((e) {
                return DropdownMenuItem<String>(
                  value: e.familyname,
                  child: Text(e.familyname!),
                );
              }).toList());
            } else {
              children = const Text('No FAMILY');
            }
            return Column(
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
                children,
                ElevatedButton(
                  child: const Text('add'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ],
            );
          },
        ));
  }
}
