import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/home/family/addfamily.dart';
import 'package:frontend/home/material/addmaterial.dart';
import 'package:frontend/home/material/material.dart';
import 'package:frontend/auth/register.dart';
import 'package:frontend/home/family/family.dart';

Route onGenerateRoute(RouteSettings setting) {
  late Widget page = const Register();
  switch (setting.name) {
    case '/family':
      page = const Family();
      break;
    case '/material':
      page = const MyMaterial();
      break;
    case '/addMaterial':
      page = const AddMaterial();
      break;
    case '/addFamily':
      page = const AddFamily();
      break;
  }
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: setting,
  );
}
