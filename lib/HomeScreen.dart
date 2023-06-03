import 'package:flutter/material.dart';
import 'package:pelifire/login_screen.dart';
import '../data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'SearchResultsScreen.dart';
import 'movie_details_screen.dart';
class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
  
}
class _HomeScreenState extends State<HomeScreen> {
List<MovieOrSeries> animationMovies = [];
  

  String searchQuery = '';
  bool isMenuOpen = false;
  List<MovieOrSeries> movieList = mainList; // Lista de películas
  
  TextEditingController _searchController = TextEditingController();

 List<MovieOrSeries> getMoviesByCategory(String category) {
  return movieList.where((movie) => movie.categories.contains(category)).toList();
}
void initState() {
    super.initState();
    // Obtener las listas de películas por categoría
    animationMovies = getMoviesByCategory('Animation');

  }
void performSearch() {
  String query = _searchController.text.trim();
  if (query.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(searchQuery: query),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Color(0xff333333),
      appBar: AppBar(
        backgroundColor: Color(0xff333333),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
        ),
        title: Container(
          height: 70,
          child: Image.asset('assets/dot1.jpg'),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            child: Image.asset('assets/dot2.jpg'),
          ),
          
        ],
        
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView(
              children: [
                        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                
                Expanded(
                  child: TextField(
                   controller: _searchController,
                    onSubmitted: (value) {
                      performSearch(); // Realiza la búsqueda al presionar "Enter" en el teclado
                    },
                    decoration: InputDecoration(
                      hintText: 'Buscar por título',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    performSearch(); // Realiza la búsqueda al presionar el icono de búsqueda
                  },
                ),
              ],
            ),
          ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Animadas',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                     Expanded(
  child: ListView.builder(
  itemCount: movieList.length,
  scrollDirection: Axis.horizontal,
  itemBuilder: (context, index) {
    MovieOrSeries movieOrSeries = movieList[index];

    if (searchQuery.isNotEmpty &&
        !movieOrSeries.title.toLowerCase().contains(searchQuery.toLowerCase()) &&
        index != 0) {
      return Container();
    }

    if (!movieOrSeries.categories.contains('Animation')) {
      return Container();
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movieOrSeries: movieOrSeries),
          ),
        );
      },
      child: Container(
        height: 150,
        width: 220,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(movieOrSeries.coverUrl),
          ),
        ),
      ),
    );
  },
),

),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Acción',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: getMoviesByCategory('Action').length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            MovieOrSeries movieOrSeries = getMoviesByCategory('Action')[index];
                          
                            if (searchQuery.isNotEmpty &&
                                !movieOrSeries.title.toLowerCase().contains(searchQuery.toLowerCase())) {
                              return Container();
                              
                            }

                            return GestureDetector(
                              child: Container(
                                height: 150,
                                width: 220,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(movieOrSeries.coverUrl),
                                  ),
                                ),
                              ),
                              onTap: () { Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movieOrSeries: movieOrSeries),
      ),
    );},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                 Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Drama',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: getMoviesByCategory('Drama').length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            MovieOrSeries movieOrSeries = getMoviesByCategory('Drama')[index];
                          
                            if (searchQuery.isNotEmpty &&
                                !movieOrSeries.title.toLowerCase().contains(searchQuery.toLowerCase())) {
                              return Container();
                              
                            }

                            return GestureDetector(
                              child: Container(
                                height: 150,
                                width: 220,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(movieOrSeries.coverUrl),
                                  ),
                                ),
                              ),
                              onTap: () { Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movieOrSeries: movieOrSeries),
      ),
    );},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Comedia',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: getMoviesByCategory('Comedy').length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            MovieOrSeries movieOrSeries = getMoviesByCategory('Comedy')[index];
                  
                            if (searchQuery.isNotEmpty &&
                                !movieOrSeries.title.toLowerCase().contains(searchQuery.toLowerCase())) {
                              return Container();
                            }

                            return GestureDetector(
                              child: Container(
                                height: 150,
                                width: 220,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(movieOrSeries.coverUrl),
                                  ),
                                ),
                              ),
                              onTap: () {Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movieOrSeries: movieOrSeries),
      ),
    );},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Continue watching',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: continueWatching.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      MovieOrSeries movieOrSeries = continueWatching[index];
                      return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Stack(
                            children: [
                              Container(
                                height: 300,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(movieOrSeries.coverUrl),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Colors.white30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'play',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 35,
                                right: 0,
                                left: 0,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 4,
                                ),
                              ),
                              const Positioned(
                                bottom: 35,
                                right: 40,
                                left: 0,
                                child: Divider(
                                  color: Colors.red,
                                  thickness: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'My List',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: myList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      MovieOrSeries movieOrSeries = myList[index];
                      return GestureDetector(
                        child: Container(
                          height: 300,
                          width: 150,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(movieOrSeries.coverUrl),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: AnimatedOpacity(
              opacity: isMenuOpen ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isMenuOpen = false;
                  });
                },
                child: isMenuOpen ? MenuContent() : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 151, 149, 149),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: ListView(
        children: [
          ListTile(
            title: Text('Descargas'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Mis favoritos'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Categorías'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Configuración'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}