import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ticket_app/widget/actor_or_director.dart';
import 'package:movie_ticket_app/widget/cinema.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildAppBar(context),
              SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildMovieTitle(),
                    _buildMovieMeta(),
                    _buildRatingSection(),
                    _buildMovieDetails(),
                    _buildStorylineSection(),
                    _buildDirectorSection(),
                    _buildActorSection(),
                    _buildCinemaSection(),
                    SizedBox(height: 100), // Space for bottom button
                  ]),
                ),
              ),
            ],
          ),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: false,
      backgroundColor: Colors.transparent,
      leading: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.red.withOpacity(0.3),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Placeholder for movie poster
              Container(
                color: Color(0xFF331111),
                child: Center(
                  child: Image.network(
                    "https://images8.alphacoders.com/979/979286.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Avengers: Infinity War',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildMovieMeta() {
    return Row(
      children: [
        Text('2h 29m', style: TextStyle(color: Colors.grey, fontSize: 14)),
        Text(' • ', style: TextStyle(color: Colors.grey)),
        Text('18.12.2022', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Text(
            'Review ★4.8 (1322)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(width: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                size: 16,
                color: index < 4 ? Colors.amber : Colors.grey[700],
              );
            }),
          ),
          SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.play_arrow, size: 16, color: Colors.white),
            label: Text(
              'Watch trailer',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDetails() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailItem('Movie genre:', 'Action, adventure, sci-fi'),
                SizedBox(height: 16),
                _buildDetailItem('Language:', 'English'),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailItemWithLink('Censorship:', '18+', 'See more'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 14)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildDetailItemWithLink(String label, String value, String linkText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 14)),
        SizedBox(height: 4),
        Row(
          children: [
            Text(value, style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: Text(
                linkText,
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStorylineSection() {
    return _buildSection(
      'Storyline',
      RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.grey[300], fontSize: 14, height: 1.5),
          children: [
            TextSpan(
              text:
                  'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. ',
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'See more',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectorSection() {
    return _buildSection(
      'Director',
      Row(
        children: [
          ProfileCard(title: 'Anthony Russo'),
          SizedBox(width: 12),
          ProfileCard(title: 'Joe Russo'),
        ],
      ),
    );
  }

  Widget _buildActorSection() {
    return _buildSection(
      'Actor',
      Row(
        children: [
          ProfileCard(title: 'Robert Downey Jr.'),
          SizedBox(width: 12),
          ProfileCard(title: 'Chris Evans'),
        ],
      ),
    );
  }

  Widget _buildCinemaSection() {
    return _buildSection(
      'Cinema',
      Column(
        children: [
          CinemaCard(
            title: 'Vincom Ocean Park CGV',
            distance: '9.32km',
            address: 'hanoi',
            logoPath:
                'https://w7.pngwing.com/pngs/330/793/png-transparent-cgv-buena-park-8-cgv-cinemas-indonesia-cj-cgv-film-zen-love-text-hand.png',
          ),
          SizedBox(height: 12),
          CinemaCard(
            title: 'BHD Star Cineplex',
            distance: '5.67km',
            address: 'ho chi minh city',
          ),
          SizedBox(height: 12),
          CinemaCard(
            title: 'Galaxy Cinema',
            distance: '3.45km',
            address: 'da nang',
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildPersonItem(String name, String initials) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[700],
            child: Text(
              initials,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCinemaItem(String name, String address, {bool isLive = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2a2a2a),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(address, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          if (isLive)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Continue pressed')));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Text(
            'Continue',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
