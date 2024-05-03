import 'package:dio/dio.dart';
import '../models/character_model.dart';

class RemoteServices {
  static var dio = Dio();
  static const baseUrl = 'YOUR_API_BASE_URL';

  static Future<List<Character>> fetchCharacters() async {
    try {
      var response = await dio.get('$baseUrl/characters');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }

  static Future<void> createCharacter(Character character) async {
    try {
      await dio.post('$baseUrl/characters', data: character.toJson());
    } catch (e) {
      throw Exception('Failed to create character: $e');
    }
  }

  static Future<void> updateCharacter(Character character) async {
    try {
      await dio.put('$baseUrl/characters/${character.id}',
          data: character.toJson());
    } catch (e) {
      throw Exception('Failed to update character: $e');
    }
  }

  static Future<void> deleteCharacter(int characterId) async {
    try {
      await dio.delete('$baseUrl/characters/$characterId');
    } catch (e) {
      throw Exception('Failed to delete character: $e');
    }
  }
}
