import 'package:flutter/cupertino.dart';
import '../models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Character> _characters = [];
  List<Character> get characters => _characters;

  String _error = '';
  String get error => _error;

  CharacterController() {
    fetchCharacters();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchCharacters() async {
    try {
      setLoading(true);
      _characters = await RemoteServices.fetchCharacters();
    } catch (e) {
      _error = 'Failed to load characters: $e';
    } finally {
      setLoading(false);
    }
  }

  Future<void> createCharacter(Character character) async {
    try {
      setLoading(true);
      await RemoteServices.createCharacter(character);
      fetchCharacters(); // Refresh the character list after creation
    } catch (e) {
      _error = 'Failed to create character: $e';
    } finally {
      setLoading(false);
    }
  }

  Future<void> updateCharacter(Character character) async {
    try {
      setLoading(true);
      await RemoteServices.updateCharacter(character);
      fetchCharacters(); // Refresh the character list after update
    } catch (e) {
      _error = 'Failed to update character: $e';
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteCharacter(Character character) async {
    try {
      setLoading(true);
      await RemoteServices.deleteCharacter(character.id);
      _characters.remove(character);
    } catch (e) {
      _error = 'Failed to delete character: $e';
    } finally {
      setLoading(false);
    }
  }
}
