import 'package:flutter/material.dart';
import 'package:movie_ticket_app/utils/app_colors.dart';

class ButtonLanguage extends StatelessWidget {
  final VoidCallback? onTap;
  final String content;
  const ButtonLanguage({super.key, this.onTap, this.content = 'English'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.note, width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.language, color: AppColors.note),
            Text(
              content,
              style: TextStyle(color: AppColors.note, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
