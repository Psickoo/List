import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/info.dart';
import 'package:http/http.dart' as http;

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(String nama, String role, String image) {
    Uri url = Uri.parse(
        "https://uasmade-95f89-default-rtdb.asia-southeast1.firebasedatabase.app/players.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "nama": nama,
          "role": role,
          "domisili": image,
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allPlayer.add(
          Player(
            id: json.decode(response.body)["nama"].toString(),
            nama: nama,
            role: role,
            domisili: image,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editPlayer(String id, String nama, String role, String image) {
    Uri url = Uri.parse(
        "https://uasmade-95f89-default-rtdb.asia-southeast1.firebasedatabase.app/players/$id.json");
    return http
        .put(
      url,
      body: json.encode(
        {
          "nama": nama,
          "role": role,
          "domisili": image,
        },
      ),
    )
        .then(
      (response) {
        Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.nama = nama;
        selectPlayer.role = role;
        selectPlayer.domisili = image;
        notifyListeners();
      },
    );
  }

  Future<void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://uasmade-95f89-default-rtdb.asia-southeast1.firebasedatabase.app/players/$id.json");
    return http.delete(url).then(
      (response) {
        _allPlayer.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://uasmade-95f89-default-rtdb.asia-southeast1.firebasedatabase.app/players.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        _allPlayer.add(
          Player(
            id: key,
            domisili: value["domisili"],
            nama: value["nama"],
            role: value["role"],
          ),
        );
      },
    );
    print("BERHASIL MASUKAN DATA LIST");

    notifyListeners();
  }
}
