import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Family extends StatefulWidget {
  const Family({Key? key}) : super(key: key);
  @override
  State<Family> createState() => MyFamilyState();
}

class MyFamilyState extends State<Family> {
  final GlobalKey<NavigatorState> key = GlobalKey();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        openCloseDial: isDialOpen,
        backgroundColor: Colors.blueAccent,
        overlayColor: Colors.grey,
        overlayOpacity: 0.5,
        spacing: 15,
        spaceBetweenChildren: 15,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.list),
              label: 'List Family',
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
              onTap: () {}),
          SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add Family',
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
              onTap: () {
                setState(() {
                  isDialOpen.value = false;
                });
                Navigator.pushNamed(context, '/addFamily');
              }),
        ],
      )),
    );
  }
}