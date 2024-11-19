import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_provider.dart';
import 'movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return Scaffold(
      backgroundColor:  Color(0xffe7e7e8),
      appBar: AppBar(
        backgroundColor: Color(0xffe7e7e8),
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.montserrat(
            color: Color(0xff212121),
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Box
            TextField(
              onSubmitted: provider.searchMovies,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                 borderSide: BorderSide(
                   color: Colors.black
                 )
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Movies List
            provider.isLoading
                ? const CircularProgressIndicator()
                : Expanded(
              child: ListView.builder(
                itemCount: provider.movies.length,
                itemBuilder: (context, index) {
                  final movie = provider.movies[index];
                  return MovieCard(
                    title: movie.title,
                    poster: movie.poster,
                    genre: movie.genre,
                    rating: movie.rating,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
