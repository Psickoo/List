import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/players.dart';

class playerdata extends StatelessWidget {
  static const routeName = "/playerdata";

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Players>(context, listen: false);
    final playerId = ModalRoute.of(context)!.settings.arguments as String;
    final selectPlayer = players.selectById(playerId);
    final TextEditingController domisiliController =
        TextEditingController(text: selectPlayer.domisili);
    final TextEditingController nameController =
        TextEditingController(text: selectPlayer.nama);
    final TextEditingController roleController =
        TextEditingController(text: selectPlayer.role);
    return Scaffold(
      appBar: AppBar(
        title: Text("Player Data"),
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
                decoration: InputDecoration(labelText: "Domisili"),
                textInputAction: TextInputAction.done,
                controller: domisiliController,
                onEditingComplete: () {
                  players
                      .editPlayer(
                    playerId,
                    nameController.text,
                    roleController.text,
                    domisiliController.text,
                  )
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil diubah"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                  });
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    players
                        .editPlayer(
                      playerId,
                      nameController.text,
                      roleController.text,
                      domisiliController.text,
                    )
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil diubah"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Edit",
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
