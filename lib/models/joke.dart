class Joke {
  final String setup;
  final String punchline;
  bool isFavorite; // Add isFavorite property

  Joke({
    required this.setup,
    required this.punchline,
    this.isFavorite = false, // Default to false
  });

  // Factory constructor to create a Joke instance from a Map
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }

  // Convert a Joke instance to a Map (useful for storing in Firebase or local storage)
  Map<String, dynamic> toJson() {
    return {
      'setup': setup,
      'punchline': punchline,
      'isFavorite': isFavorite,
    };
  }
}
