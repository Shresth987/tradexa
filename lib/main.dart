import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tradexa/search_provider.dart';

import 'movie_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SearchProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: const Color(0xffF6F6F6),
      ),
      home: const MovieListScreen(),
    );
  }
}
