import 'package:app_filmes/pages/movie_list/movie_list_page.dart';
import 'package:app_filmes/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff15173d),
        colorScheme: const ColorScheme.dark(primary: Color(0xffbb86fc)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff15173d),
        ),
        useMaterial3: true,
      ),
      home: const MovieListPage(),
    );
  }
}

