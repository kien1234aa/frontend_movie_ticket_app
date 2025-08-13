import 'package:flutter/material.dart';

class CinemaCard extends StatelessWidget {
  final String title;
  final String distance;
  final String address;
  final String? logoPath; // Asset path

  const CinemaCard({
    super.key,
    required this.title,
    required this.distance,
    required this.address,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Chiều rộng cố định
      height: 80, // Chiều cao cố định
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1E08), // Nền nâu đậm
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.amber, // Viền vàng
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      distance,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '|',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        address,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
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
          // Logo
          if (logoPath != null && logoPath!.isNotEmpty)
            Image.network(
              logoPath!,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
        ],
      ),
    );
  }
}
