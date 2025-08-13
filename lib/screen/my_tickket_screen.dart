import 'package:flutter/material.dart';

class MyTicketsListScreen extends StatefulWidget {
  @override
  _MyTicketsListScreenState createState() => _MyTicketsListScreenState();
}

class _MyTicketsListScreenState extends State<MyTicketsListScreen> {
  final List<TicketItem> tickets = [
    TicketItem(
      movieTitle: 'Avengers: Infinity War',
      showTime: '14h15\'',
      date: '16.12.2022',
      cinema: 'Vincom Ocean Park CGV',
      posterGradient: [Colors.red.shade800, Colors.orange.shade600],
      isActive: true,
    ),
    TicketItem(
      movieTitle: 'Batman v Superman: Dawn of Justice',
      showTime: '2h15m',
      date: '22.12.2022',
      cinema: 'Vincom Ocean Park CGV',
      posterGradient: [Colors.grey.shade800, Colors.grey.shade600],
      isActive: false,
    ),
    TicketItem(
      movieTitle: 'Guardians Of The Galaxy',
      showTime: '14h15\'',
      date: '29.12.2022',
      cinema: 'Vincom Ocean Park CGV',
      posterGradient: [Colors.purple.shade700, Colors.blue.shade600],
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'My ticket',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Ticket list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return TicketCard(
                    ticket: tickets[index],
                    isFirst: index == 0,
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

class TicketCard extends StatelessWidget {
  final TicketItem ticket;
  final bool isFirst;

  const TicketCard({Key? key, required this.ticket, this.isFirst = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ticket details
        print('Tapped on ${ticket.movieTitle}');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: isFirst
              ? Border.all(color: Colors.amber.shade600, width: 2)
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Movie poster
              Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: ticket.posterGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Movie poster placeholder
                      Center(
                        child: Text(
                          ticket.movieTitle[0].toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Overlay gradient
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            stops: [0.5, 1.0],
                          ),
                        ),
                      ),
                      // Movie title overlay
                      Positioned(
                        bottom: 8,
                        left: 8,
                        right: 8,
                        child: Text(
                          _getShortTitle(ticket.movieTitle),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16),

              // Movie details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie title
                    Text(
                      ticket.movieTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 12),

                    // Show time and date
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey.shade400,
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '${ticket.showTime} • ${ticket.date}',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Cinema location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey.shade400,
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            ticket.cinema,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Status indicator dots (only for active ticket)
                    if (isFirst)
                      Row(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 0
                                  ? Colors.amber.shade600
                                  : Colors.grey.shade600,
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              ),

              // Chevron icon
              Icon(Icons.chevron_right, color: Colors.grey.shade600, size: 24),
            ],
          ),
        ),
      ),
    );
  }

  String _getShortTitle(String title) {
    // Shorten title for poster overlay
    switch (title) {
      case 'Avengers: Infinity War':
        return 'AVENGERS\nINFINITY WAR';
      case 'Batman v Superman: Dawn of Justice':
        return 'BATMAN V\nSUPERMAN';
      case 'Guardians Of The Galaxy':
        return 'GUARDIANS\nGALAXY';
      default:
        return title.toUpperCase();
    }
  }
}

// Ticket model
class TicketItem {
  final String movieTitle;
  final String showTime;
  final String date;
  final String cinema;
  final List<Color> posterGradient;
  final bool isActive;

  TicketItem({
    required this.movieTitle,
    required this.showTime,
    required this.date,
    required this.cinema,
    required this.posterGradient,
    this.isActive = false,
  });
}

// Main app để test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tickets',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyTicketsListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
