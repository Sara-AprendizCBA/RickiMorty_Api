import 'package:flutter/material.dart';
import 'package:rickimorty_api/models/character_mode.dart';
import 'package:rickimorty_api/models/episode_model.dart';
import 'package:rickimorty_api/services/character_services.dart';

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

