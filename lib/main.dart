import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './data/players.dart';
import './widget/data.dart';
import './widget/adddata.dart';
import './widget/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Players(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          AddPlayer.routeName: (context) => AddPlayer(),
          playerdata.routeName: (context) => playerdata(),
        },
      ),
    );
  }
}
