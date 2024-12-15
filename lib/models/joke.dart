class Joke {
  final String setup;
  final String punchline;

  Joke({required this.setup, required this.punchline});

  // Factory constructor to create a Joke instance from a Map
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
