import 'package:flutter/material.dart';

class MovieIntroWidget extends StatelessWidget {
  const MovieIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Poster image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://tse4.mm.bing.net/th/id/OIP.qkEqXuj-eG6sdVTqFmJJjQHaLH?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', // Đổi theo đường dẫn của bạn
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),

        // Main title
        const Text(
          'MBooking hello!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        const Text(
          'Enjoy your favorite movies',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),

        const SizedBox(height: 16),

        // Page indicator dots
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotIndicator(isActive: true),
            DotIndicator(isActive: false),
            DotIndicator(isActive: false),
          ],
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.amber : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
