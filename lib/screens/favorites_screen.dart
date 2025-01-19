import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../widgets/joke_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Joke> favoriteJokes =
        ModalRoute.of(context)!.settings.arguments as List<Joke>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Jokes"),
      ),
      body: favoriteJokes.isEmpty
          ? const Center(child: Text("No favorite jokes yet!"))
          : ListView.builder(
              itemCount: favoriteJokes.length,
              itemBuilder: (context, index) {
                return JokeCard(
                  joke: favoriteJokes[index],
                );
              },
            ),
    );
  }
}
