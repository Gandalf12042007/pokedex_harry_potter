import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PokedexHarryPotterApp());
}

class PokedexHarryPotterApp extends StatelessWidget {
  const PokedexHarryPotterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Harry Potter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.cinzelTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
