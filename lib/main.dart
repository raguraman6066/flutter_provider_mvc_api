import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/character_controller.dart';
import 'views/character_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharacterController(),
      child: MaterialApp(
        title: 'Character App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CharacterListPage(),
      ),
    );
  }
}
