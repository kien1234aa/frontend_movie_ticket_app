import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String? imagePath;
  final String title;

  const ProfileCard({super.key, this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    // Tách tên ra 2 dòng (nếu có khoảng trắng)
    final nameParts = title.split(' ');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ảnh hoặc icon mặc định
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[700],
            backgroundImage: (imagePath != null && imagePath!.isNotEmpty)
                ? AssetImage(imagePath!)
                : null,
            child: (imagePath == null || imagePath!.isEmpty)
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 8),
          // Tên chia thành 2 dòng
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameParts.isNotEmpty ? nameParts.first : '',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
