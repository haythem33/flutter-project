import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/services/family/familyservice.dart';
import 'package:frontend/services/materiell/materilservice.dart';

class ListMaterial extends StatefulWidget {
  const ListMaterial({Key? key}) : super(key: key);

  @override
  State<ListMaterial> createState() => ListMaterialState();
}

class ListMaterialState extends State<ListMaterial> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Materielservice.getAllMaterial(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Materiel>> projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none ||
              !projectSnap.hasData) {
            return const Text("NO DATA");
          }
          return ListView.builder(
              itemCount: projectSnap.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.album, size: 48),
                            title: Text(projectSnap.data![index].nomMateriel!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            subtitle: Text(projectSnap.data![index].nomF!,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.grey)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('More detail'),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('Borrow'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
