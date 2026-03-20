import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/models/character_mode.dart';
import 'package:rickandmortyapp/providers/api_provider.dart';
import 'package:rickandmortyapp/providers/character_provider.dart';
import 'package:rickandmortyapp/screens/character_screen.dart';
import 'package:rickandmortyapp/screens/favorites_screen.dart';
import 'package:rickandmortyapp/screens/home_screen.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: 'character',
        builder: (context, state) {
          final character = state.extra as Character;
          return CharacterScreen(character: character);
        },
      ),
      GoRoute(
        path: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
    ],
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiProvider()),
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
      ],
      child: MaterialApp.router(
        title: 'Rick And Morty APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        routerConfig: _router,
      ),
    );
  }
}