import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_mode.dart';
import 'package:rickandmortyapp/models/episode_model.dart';
import 'package:rickandmortyapp/services/character_service.dart';

class ApiProvider with ChangeNotifier {
  final CharacterService _service = CharacterService();

  List<Character> characters = [];
  List<Episode> episodes = [];

  Future<void> getCharacters(int page) async {
    final results = await _service.getCharacters(page);
    characters.addAll(results);
    notifyListeners();
  }

  Future<List<Character>> getCharacter(String name) async {
    return await _service.searchCharacters(name);
  }

  Future<List<Episode>> getEpisodes(Character character) async {
    episodes = [];
    notifyListeners();
    episodes = await _service.getEpisodes(character);
    notifyListeners();
    return episodes;
  }
}  
