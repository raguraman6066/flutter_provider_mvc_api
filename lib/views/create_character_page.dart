import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import '../models/character_model.dart';

class CreateCharacterPage extends StatefulWidget {
  @override
  _CreateCharacterPageState createState() => _CreateCharacterPageState();
}

class _CreateCharacterPageState extends State<CreateCharacterPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Character'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final character = Character(
                  id: 0, // Assigning 0 for ID as it's a new character
                  name: _nameController.text,
                );
                Provider.of<CharacterController>(context, listen: false)
                    .createCharacter(character);
                Navigator.pop(context);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
