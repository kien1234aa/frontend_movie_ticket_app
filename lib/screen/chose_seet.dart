import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  Set<String> selectedSeats = {'E4', 'H7'};
  Set<String> reservedSeats = {'A5', 'B3', 'C8', 'D6', 'F9', 'G2', 'H5'};
  int selectedDate = 10;
  String selectedTime = '14:15';

  final List<String> rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J'];
  final List<int> columns = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  final List<int> dates = [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  final List<String> times = ['11:05', '14:15', '16:30', '20:45'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Select seat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Screen representation
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber.shade600, Colors.amber.shade800],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // Seat grid
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 13,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: rows.length * columns.length,
                itemBuilder: (context, index) {
                  int rowIndex = index ~/ columns.length;
                  int colIndex = index % columns.length;

                  String seatId = '${rows[rowIndex]}${columns[colIndex]}';
                  bool isSelected = selectedSeats.contains(seatId);
                  bool isReserved = reservedSeats.contains(seatId);
                  bool isAvailable = !isSelected && !isReserved;

                  return GestureDetector(
                    onTap: isReserved
                        ? null
                        : () {
                            setState(() {
                              if (isSelected) {
                                selectedSeats.remove(seatId);
                              } else {
                                selectedSeats.add(seatId);
                              }
                            });
                          },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.amber.shade600
                            : isReserved
                            ? Colors.grey.shade700
                            : Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          seatId,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Legend
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem('Available', Colors.grey.shade800),
                _buildLegendItem('Reserved', Colors.grey.shade700),
                _buildLegendItem('Selected', Colors.amber.shade600),
              ],
            ),
          ),

          // Date & Time Selection
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Date & Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16),

                // Date selection
                Container(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      bool isSelected = dates[index] == selectedDate;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = dates[index];
                          });
                        },
                        child: Container(
                          width: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.amber.shade600
                                : Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dec',
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${dates[index]}',
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 16),

                // Time selection
                Wrap(
                  spacing: 12,
                  children: times.map((time) {
                    bool isSelected = time == selectedTime;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.amber.shade600
                              : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Bottom section with price and button
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          '210.000 VND',
                          style: TextStyle(
                            color: Colors.amber.shade600,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: selectedSeats.isNotEmpty
                          ? () {
                              // Handle ticket booking
                              print('Booking seats: $selectedSeats');
                              print('Date: Dec $selectedDate');
                              print('Time: $selectedTime');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade600,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Buy ticket',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 8),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

// Main app để test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Selection',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SeatSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
