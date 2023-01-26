import 'package:flutter/material.dart';

import 'home/page/popular_movie_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: PopularMoviePage(),
    );
  }
}


