import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;
  final VoidCallback? onFavoriteToggle;

  const JokeCard({super.key, required this.joke, this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(joke.setup,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(joke.punchline,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    joke.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: joke.isFavorite ? Colors.red : null,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
