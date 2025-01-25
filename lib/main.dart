import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/pages/homepage.dart';
import 'provider/film_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilmProvider(),
      child: MaterialApp(
        home: Scaffold(
          body: Homepage(),
        ),
      ),
    );
  }
}
