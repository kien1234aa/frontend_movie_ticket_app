import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Movie> nowPlayingMovies = [
    Movie(
      title: 'Shang chi: Legend of the Ten Rings',
      rating: 4.0,
      reviews: 982,
      duration: '2 hour 5 minutes',
      genres: ['Action', 'Sci-fi'],
      posterGradient: [Colors.teal.shade800, Colors.blue.shade600],
    ),
    Movie(
      title: 'Avengers: Infinity War',
      rating: 4.5,
      reviews: 1250,
      duration: '2 hour 29 minutes',
      genres: ['Action', 'Adventure'],
      posterGradient: [Colors.red.shade800, Colors.orange.shade600],
    ),
  ];

  final List<Movie> comingSoonMovies = [
    Movie(
      title: 'Batman v Superman: Dawn of Justice',
      rating: 4.0,
      reviews: 982,
      duration: '2 hour 10 minutes',
      genres: ['Action', 'Sci-fi'],
      posterGradient: [Colors.grey.shade800, Colors.grey.shade600],
    ),
    Movie(
      title: 'Guardians of the Galaxy',
      rating: 4.2,
      reviews: 1100,
      duration: '2 hour 1 minutes',
      genres: ['Action', 'Adventure'],
      posterGradient: [Colors.purple.shade700, Colors.blue.shade600],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Tab bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.amber.shade600,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Now playing'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Coming soon'),
                    ),
                  ),
                ],
              ),
            ),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Now playing tab
                  MovieGrid(movies: nowPlayingMovies),
                  // Coming soon tab
                  MovieGrid(movies: comingSoonMovies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;

  const MovieGrid({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        childAspectRatio: 0.65,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to movie details
        print('Tapped on ${movie.title}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie poster
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: movie.posterGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    // Poster placeholder with movie initial
                    Center(
                      child: Text(
                        movie.title[0].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Overlay for better text visibility
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    // Movie title overlay
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Text(
                        movie.title.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 12),

          // Movie title
          Text(
            movie.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 8),

          // Rating
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber.shade600, size: 16),
              SizedBox(width: 4),
              Text(
                movie.rating.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
              Text(
                '(${movie.reviews})',
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
            ],
          ),

          SizedBox(height: 4),

          // Duration
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.grey.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                movie.duration,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
            ],
          ),

          SizedBox(height: 4),

          // Genres
          Row(
            children: [
              Icon(Icons.local_movies, color: Colors.grey.shade400, size: 16),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  movie.genres.join(', '),
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Movie model
class Movie {
  final String title;
  final double rating;
  final int reviews;
  final String duration;
  final List<String> genres;
  final List<Color> posterGradient;

  Movie({
    required this.title,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.genres,
    required this.posterGradient,
  });
}

// Main app để test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
