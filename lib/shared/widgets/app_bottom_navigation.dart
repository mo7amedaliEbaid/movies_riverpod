import 'package:flutter/material.dart';
import 'package:movies_riverpod/app/app_text_styles.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;

  final Function(int) onTapped;

  const AppBottomNavigation(
      {Key? key, required this.currentIndex, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => onTapped(index),
      currentIndex: currentIndex,
      selectedLabelStyle:
          AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: AppTextStyles.bodySmall,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.upcoming), label: 'Upcoming'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks')
      ],
    );
  }
}
