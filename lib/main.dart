import 'package:flutter/material.dart';
import 'package:reversion/views/routes/home.dart';
import 'package:reversion/views/routes/new_note.dart';
import 'package:reversion/views/routes/new_project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Re:version',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFBB03B)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
        secondaryHeaderColor: Color(0xFFF15A24),
      ),
      home: const Home(title: 'Welcome to Re:version!'),
      routes: {
        'note': (context) => NewNote(),
        'add': (context) => NewProject(),
      },
    );
  }
}
