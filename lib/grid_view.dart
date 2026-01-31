import 'package:flutter/material.dart';

class MovieGridView extends StatelessWidget {
  final List<Map<String, dynamic>> movies;

  // Menerima data dari main.dart
  const MovieGridView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom sesuai slide
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2, // Agar kartu tidak terlalu tinggi
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        bool isDone = movie['status'] == "Sudah Tonton";

        return Card(
          color: isDone ? Colors.green[100] : Colors.orange[100],
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.movie,
                size: 40,
                color: isDone ? Colors.green : Colors.deepOrange,
              ),
              SizedBox(height: 8),
              Text(
                movie['judul'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                movie['genre'],
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ],
          ),
        );
      },
    );
  }
}