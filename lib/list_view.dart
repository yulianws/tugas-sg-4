import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List<Map<String, dynamic>> movies;

  // Menerima data dari main.dart
  const MovieListView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        bool isDone = movie['status'] == "Sudah Tonton";

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: isDone ? Colors.green : Colors.grey,
            child: Text(
              movie['judul'][0], // Ambil huruf pertama
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(movie['judul']),
          subtitle: Text("${movie['genre']} • Rating: ${movie['rating']}/5"),
          trailing: Text(
            movie['status'],
            style: TextStyle(
              color: isDone ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}