import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/models/character_mode.dart';
import 'package:rickandmortyapp/models/episode_model.dart';

class CharacterService {
  final String _baseUrl = 'rickandmortyapi.com';

  Future<List<Character>> getCharacters(int page) async {
    final result = await http.get(Uri.https(_baseUrl, "/api/character", {
      'page': page.toString(),
    }));
    final response = characterResponseFromJson(result.body);
    return response.results!;
  }

  Future<List<Character>> searchCharacters(String name) async {
    final result = await http
        .get(Uri.https(_baseUrl, '/api/character/', {'name': name}));
    final response = characterResponseFromJson(result.body);
    return response.results!;
  }

  Future<List<Episode>> getEpisodes(Character character) async {
    List<Episode> episodes = [];
    for (var i = 0; i < character.episode!.length; i++) {
      final result = await http.get(Uri.parse(character.episode![i]));
      episodes.add(episodeFromJson(result.body));
    }
    return episodes;
  }
}