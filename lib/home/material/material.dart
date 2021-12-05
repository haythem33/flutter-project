import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyMaterial extends StatefulWidget {
  const MyMaterial({Key? key}) : super(key: key);

  @override
  State<MyMaterial> createState() => MyMaterialState();
}

class MyMaterialState extends State<MyMaterial> {
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
              label: 'List Material',
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
              onTap: () {}),
          SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add Material',
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
              onTap: () {
                setState(() {
                  isDialOpen.value = false;
                });
                Navigator.pushNamed(context, '/addMaterial');
              }),
        ],
      )),
    );
  }
}
