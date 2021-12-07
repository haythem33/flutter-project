import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/famille.dart';
import 'package:frontend/services/family/familyservice.dart';

import 'dart:async';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class listFamily extends StatefulWidget {
  const listFamily({Key? key}) : super(key: key);
  @override
  State<listFamily> createState() => _listFamily();
}

class _listFamily extends State<listFamily> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nomF;
  List<Famille>? allFamily;

  @override
  Widget build(BuildContext mycontext) {
    return Form(
        key: _formKey,
        child: FutureBuilder<List<Famille>>(
          future: Familyservice.getAllFamily(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Famille>> snapshot) {
            Widget children;
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return Container();
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Famille? fam = snapshot.data?.elementAt(index);
                return Column(
                  children: <Widget>[
                  ],
                );
              },
            );
          },
        ));
  }
  
}
