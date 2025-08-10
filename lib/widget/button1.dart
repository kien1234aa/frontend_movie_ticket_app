import 'package:flutter/material.dart';
import 'package:movie_ticket_app/utils/app_colors.dart';

class Button1 extends StatelessWidget {
  final VoidCallback? onTap;
  final String content;
  final double width;
  final double height;

  const Button1({
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
        width: width.toDouble(),
        height: height.toDouble(),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.note, width: 1), // Bo góc
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              color: AppColors.note, // Màu chữ
              fontSize: 18, // Kích thước chữ
              fontWeight: FontWeight.bold, // Đậm
            ),
          ),
        ),
      ),
    );
  }
}
