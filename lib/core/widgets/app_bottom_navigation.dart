import 'package:flutter/material.dart';
import '../app/app_strings.dart';
import '../app/app_text_styles.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;

  final Function(int) onTapped;

  const AppBottomNavigation(
      {Key? key, required this.currentIndex, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTapped(index),
      selectedItemColor: Colors.amber.shade700,
      currentIndex: currentIndex,
      selectedLabelStyle:
          AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: AppTextStyles.bodySmall,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.movie), label: AppStrings.home),
        BottomNavigationBarItem(
            icon: Icon(Icons.upcoming), label: AppStrings.upcoming),
        BottomNavigationBarItem(
            icon: Icon(Icons.trending_up), label: AppStrings.trending),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark), label: AppStrings.bookmarks)
      ],
    );
  }
}
