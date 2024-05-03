import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import '../models/character_model.dart';
import 'create_character_page.dart';
import 'update_character_page.dart';

class CharacterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character List'),
      ),
      body: Consumer<CharacterController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error.isNotEmpty || controller.error != '') {
            return Center(child: Text(controller.error));
          } else {
            return ListView.builder(
              itemCount: controller.characters.length,
              itemBuilder: (context, index) {
                final character = controller.characters[index];
                return ListTile(
                  title: Text(character.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpdateCharacterPage(character: character),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          controller.deleteCharacter(character);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCharacterPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
