import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import '../models/character_model.dart';

class UpdateCharacterPage extends StatefulWidget {
  final Character character;

  UpdateCharacterPage({required this.character});

  @override
  _UpdateCharacterPageState createState() => _UpdateCharacterPageState();
}

class _UpdateCharacterPageState extends State<UpdateCharacterPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.character.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Character'),
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
                final updatedCharacter = Character(
                  id: widget.character.id,
                  name: _nameController.text,
                );
                Provider.of<CharacterController>(context, listen: false)
                    .updateCharacter(updatedCharacter);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
