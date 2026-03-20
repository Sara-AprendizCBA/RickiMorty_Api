import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickimorty_api/providers/character_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<CharacterProvider>(context);
    final favorites = favProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favoritos',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No hay favoritos',
                  style: TextStyle(fontSize: 16)))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final character = favorites[index];
                return GestureDetector(
                  onTap: () => context.go('/character', extra: character),
                  child: Card(
                    child: Column(
                      children: [
                        Hero(
                          tag: 'fav_${character.id}',
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/images/portal.gif'),
                            image: NetworkImage(character.image!),
                          ),
                        ),
                        Text(
                          character.name!,
                          style: const TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

