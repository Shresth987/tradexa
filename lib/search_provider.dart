import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchProvider extends ChangeNotifier {
  List<Movie> movies = [];
  bool isLoading = false;

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;

    isLoading = true;
    notifyListeners();

    final url = 'https://imdb-movies-web-series-etc-search.p.rapidapi.com/${query.toLowerCase().replaceAll(' ', '')}.json';
    final headers = {
      'X-RapidAPI-Key': '3d004705c2mshd42af521cd5a1a9p1a3ca4jsnbbf78a0a4387',
      'X-RapidAPI-Host': 'imdb-movies-web-series-etc-search.p.rapidapi.com',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final searchResults = data['d'] ?? [];

        movies = [];
        for (var movie in searchResults) {
          //  ---------->>> Ensuring only movies (filter out actors, series, etc.)   <<<<-----------
          if (movie['qid'] == 'movie') {
            movies.add(Movie(
              title: movie['l'] ?? 'N/A',
              poster: movie['i']?['imageUrl'] ?? '',
              genre: movie['q'] ?? 'Unknown',
              rating: _generateRandomRating(), //      -------->>>>>>>> IMDb API doesn't provide rating in search;   <<<<<<<<-----------
            ));
          }
        }
      } else {
        movies = [];
      }
    } catch (e) {
      print('Error: $e');
      movies = [];
    }

    isLoading = false;
    notifyListeners();
  }

  double _generateRandomRating() {
    return double.parse((4 + (6 * (new DateTime.now().millisecondsSinceEpoch % 1000) / 1000)).toStringAsFixed(1));
  }

}

class Movie {
  final String title;
  final String poster;
  final String genre;
  final double rating;

  Movie({
    required this.title,
    required this.poster,
    required this.genre,
    required this.rating,
  });
}
