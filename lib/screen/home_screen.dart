import 'package:flutter/material.dart';
import 'package:movie_ticket_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 10),
              _buildNowPlayingSection(),
              const SizedBox(height: 20),
              _buildComingSoonSection(),
              const SizedBox(height: 20),
              _buildSaleTicket(),
              const SizedBox(height: 20),
              _buildServiceSection(),
              _buildMovieNewsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Angelina 👋',
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              Text(
                'Welcome back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'See all >',
            style: TextStyle(color: AppColors.button1, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildNowPlayingSection() {
    return Column(
      children: [
        _buildSectionHeader('Now playing'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.orange[800]!, Colors.red[900]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://tse4.mm.bing.net/th/id/OIP.qkEqXuj-eG6sdVTqFmJJjQHaLH',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AVENGERS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'INFINITY WAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Action • Adventure • Sci-Fi',
                      style: TextStyle(color: Colors.grey[300], fontSize: 12),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 5),
                        Text(
                          '8.5 (72k)',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComingSoonSection() {
    return Column(
      children: [
        SizedBox(height: 30),
        _buildSectionHeader('Coming soon'),
        SizedBox(
          height: 220,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildComingSoonCard(
                'https://th.bing.com/th/id/R.54b6bf82de9a25fff759d662b98ecde7?rik=qZhzaxb9%2fzdQlg&pid=ImgRaw&r=0',
                'Avatar 2',
                'Galaxy ĐN',
                '2023-12-15',
              ),
              _buildComingSoonCard(
                'https://th.bing.com/th/id/OIP.lXzCvrnInawFeoJW9JUIBAHaLH?w=115&h=180',
                'The Flash',
                'Action, Adventure',
                '2023-06-16',
              ),
              _buildComingSoonCard(
                'https://th.bing.com/th/id/R.0d48deb25ed5d15d9c76f6d8b6488906?rik=6EFjgETZ8bELuQ&pid=ImgRaw&r=0',
                'BatMan',
                'Action, Adventure',
                '2022-03-04',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComingSoonCard(
    String imagePath,
    String title,
    String genres,
    String releaseDate,
  ) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imagePath,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[800],
                  child: Icon(Icons.movie, color: Colors.grey[600], size: 40),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.movie, size: 12, color: Colors.white54),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        genres,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: Colors.white54,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        releaseDate,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaleTicket() {
    return Column(
      children: [
        SizedBox(height: 30),
        _buildSectionHeader('Promo & Discount'),
        SizedBox(
          child: Image.asset(
            'assets/images/sale_tickket.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(String title, String imagePath) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildServiceSection() {
    return Column(
      children: [
        SizedBox(height: 30),
        _buildSectionHeader('Service'),
        SizedBox(height: 10),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 40),
            children: [
              _buildServiceCard('Retal', 'assets/images/retal.png'),
              _buildServiceCard('IMAX', 'assets/images/imax.png'),
              _buildServiceCard('4DX', 'assets/images/4dx.png'),
              _buildServiceCard('ScreenX', 'assets/images/sweet_box.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(String title) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 15),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[800],
            ),
            child: Icon(Icons.article, color: Colors.grey[600]),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieNewsSection() {
    return Column(
      children: [
        SizedBox(height: 30),
        _buildSectionHeader('Movie news'),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildNewsCard(
                'When The Batman 2 Starts Filming Reportedly Revealed',
              ),
              _buildNewsCard('6 Epic Hulk Fights That Happen In The MCU'),
            ],
          ),
        ), // Space for bottom nav
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[600],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
