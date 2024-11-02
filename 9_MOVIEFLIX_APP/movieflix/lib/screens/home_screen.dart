import 'package:flutter/material.dart';
import 'package:movieflix/components/movie_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue, // Colors.white,
        title: const Text("MovieFlix"),
      ),
      body: Column(
        children: [
          MovieSection(),
        ],
      ),
    );
  }
}
