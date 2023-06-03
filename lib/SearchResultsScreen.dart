import 'package:flutter/material.dart';
import '../data/data.dart';

class SearchResultsScreen extends StatelessWidget {
  final String searchQuery;
  List<MovieOrSeries> movieList = mainList;

  SearchResultsScreen({required this.searchQuery});

  List<MovieOrSeries> searchMovies() {
    // Filtrar la lista de películas por el término de búsqueda
    return movieList
        .where((movie) =>
            movie.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<MovieOrSeries> searchResults = searchMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de búsqueda'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          MovieOrSeries movie = searchResults[index];
          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla de detalles de la película
             /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(movieOrSeries: movie),
                ),
              );*/
            },
            child: Card(
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(movie.coverUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Descripción: ${movie.description}',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Categorías: ${movie.categories}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Año: ${movie.year}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Ciudad: ${movie.country}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Duración: ${movie.length}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
