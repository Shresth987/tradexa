import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String poster;
  final String genre;
  final double rating;

  const MovieCard({
    Key? key,
    required this.title,
    required this.poster,
    required this.genre,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 19),
            ),
          ],
        ),
        child: Row(
          children: [
            // Movie poster inside a Stack
            Container(
              margin: const EdgeInsets.all(12),
              height: 120,
              width: 130,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        poster,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 180,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:  GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      genre,
                      style:  GoogleFonts.montserrat(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: rating > 7
                            ? const Color(0xff5EC570)
                            : const Color(0xff1C7EEB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$rating IMDB',
                        style:  GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
