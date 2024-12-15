import 'package:flutter/material.dart';
import '../services/api_services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke Types"),
        actions: [
          IconButton(
            icon: Icon(Icons.sentiment_very_satisfied),
            onPressed: () {
              Navigator.pushNamed(context, '/random');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: ApiServices.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Failed to load joke types."));
          }

          final types = snapshot.data ?? [];
          return ListView.builder(
            itemCount: types.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(types[index], style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.pushNamed(context, '/jokes',
                      arguments: types[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
