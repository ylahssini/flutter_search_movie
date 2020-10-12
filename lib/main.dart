import 'package:flutter/material.dart';

import 'package:movie_search/src/home/home.dart';

void main() {
  runApp(MovieSearch());
}

class MovieSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search',
      theme: ThemeData(
        primaryColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Movie search'),
    );
  }
}

