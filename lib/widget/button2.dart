import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final VoidCallback? onTap;
  final String content;
  final double width;
  final double height;

  const Button2({
    super.key,
    required this.onTap,
    required this.content,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFFCC434), // Màu nền của nút
          borderRadius: BorderRadius.circular(40), // Bo góc
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black, // Màu chữ
              fontSize: 18, // Kích thước chữ
              fontWeight: FontWeight.bold, // Đậm
            ),
          ),
        ),
      ),
    );
  }
}
