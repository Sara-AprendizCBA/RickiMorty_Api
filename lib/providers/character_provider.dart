import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rickandmortyapp/models/character_mode.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _favorites = [];

  List<Character> get favorites => _favorites;

  CharacterProvider() {
    _loadFavorites();
  }

  bool isFavorite(int characterId) {
    return _favorites.any((c) => c.id == characterId);
  }

  void toggleFavorite(Character character) {
    if (isFavorite(character.id!)) {
      _favorites.removeWhere((c) => c.id == character.id);
    } else {
      _favorites.add(character);
    }
    _saveFavorites();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = _favorites.map((c) => jsonEncode(c.toJson())).toList();
    await prefs.setStringList('favorites', list);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('favorites') ?? [];
    _favorites = list.map((s) => Character.fromJson(jsonDecode(s))).toList();
    notifyListeners();
  }
}  
