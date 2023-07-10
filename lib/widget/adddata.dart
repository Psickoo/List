import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/players.dart';

class AddPlayer extends StatelessWidget {
  static const routeName = "/add-player";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Players>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Player Data"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              players
                  .addPlayer(
                nameController.text,
                roleController.text,
                domisiliController.text,
              )
                  .then(
                (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Role"),
                textInputAction: TextInputAction.next,
                controller: roleController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "domisili"),
                textInputAction: TextInputAction.done,
                controller: domisiliController,
                onEditingComplete: () {
                  players
                      .addPlayer(
                    nameController.text,
                    roleController.text,
                    domisiliController.text,
                  )
                      .then(
                    (response) {
                      print("Kembali ke Home & kasih notif snack bar");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil ditambahkan"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    players
                        .addPlayer(
                      nameController.text,
                      roleController.text,
                      domisiliController.text,
                    )
                        .then(
                      (response) {
                        print("Kembali ke Home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
