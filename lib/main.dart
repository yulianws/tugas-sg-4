import 'package:flutter/material.dart';
import 'list_view.dart'; // Import file list
import 'grid_view.dart'; // Import file grid

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Watchlist App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WatchlistApp(),
    );
  }
}

class WatchlistApp extends StatefulWidget {
  const WatchlistApp({Key? key}) : super(key: key);

  @override
  State<WatchlistApp> createState() => _WatchlistAppState();
}

class _WatchlistAppState extends State<WatchlistApp> {
  // 1. Data JSON (Di sini agar bisa dikirim ke kedua halaman)
  final List<Map<String, dynamic>> movies = [
    {"judul": "Inception", "genre": "Sci-Fi", "rating": 5, "status": "Sudah Tonton"},
    {"judul": "Interstellar", "genre": "Sci-Fi", "rating": 5, "status": "Sudah Tonton"},
    {"judul": "The Dark Knight", "genre": "Action", "rating": 5, "status": "Sudah Tonton"},
    {"judul": "Tenet", "genre": "Action", "rating": 4, "status": "Belum"},
    {"judul": "Dune", "genre": "Adventure", "rating": 4, "status": "Sudah Tonton"},
    {"judul": "Oppenheimer", "genre": "History", "rating": 5, "status": "Belum"},
    {"judul": "The Matrix", "genre": "Action", "rating": 4, "status": "Sudah Tonton"},
    {"judul": "Arrival", "genre": "Sci-Fi", "rating": 4, "status": "Belum"},
  ];

  int _currentIndex = 0; // State untuk index halaman aktif

  @override
  Widget build(BuildContext context) {
    // List halaman disimpan di dalam build agar bisa akses variabel 'movies'
    final List<Widget> pages = [
      MovieGridView(movies: movies), // Kirim data ke Grid
      MovieListView(movies: movies), // Kirim data ke List
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watchlist App"),
        centerTitle: true,
      ),
      body: pages[_currentIndex], // Tampilkan halaman sesuai index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Ganti halaman (Refresh UI)
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Grid View",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List View",
          ),
        ],
      ),
    );
  }
}