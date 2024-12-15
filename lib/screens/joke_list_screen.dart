import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class JokeListScreen extends StatelessWidget {
  const JokeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String type = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Jokes: $type")),
      body: FutureBuilder(
        future: ApiServices.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to load jokes."));
          }

          final jokes = snapshot.data ?? [];
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              return JokeCard(joke: jokes[index]);
            },
          );
        },
      ),
    );
  }
}
