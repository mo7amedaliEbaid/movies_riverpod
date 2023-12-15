import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_riverpod/features/bookmarks/presentation/screens/bookmark_screen.dart';
import 'package:movies_riverpod/features/movies/presentation/screens/home_screen.dart';
import 'package:movies_riverpod/features/movies/presentation/screens/trending_screen.dart';
import 'package:movies_riverpod/features/movies/presentation/screens/upcoming_screen.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_bottom_navigation.dart';
import '../../../../core/widgets/app_drawer.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: homePageBody(),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTapped: _onTabTapped,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
   //   log('index $index');
      _currentIndex = index;
    });
  }

  Widget homePageBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const UpcomingScreen();
      case 2:
        return const TrendingScreen();
      case 3:
        return const BookmarkScreen();
      default:
        return Container();
    }
  }
}
