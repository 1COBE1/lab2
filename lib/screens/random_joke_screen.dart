import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Joke")),
      body: FutureBuilder(
        future: ApiServices.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to load random joke."));
          }

          final joke = snapshot.data;
          return joke != null
              ? JokeCard(joke: joke)
              : const Center(child: Text("No joke found."));
        },
      ),
    );
  }
}
