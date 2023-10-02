import 'package:google_maps_flutter/google_maps_flutter.dart';

interface class AppConstants {
  static const String NOW_SHOWING = 'now_showing';
  static const String POPULAR = 'popular';
  static const String LENGTH = 'Length';
  static const String LANGUAGE = 'Language';
  static const String RATING = 'Rating';
  static const String DESCRIPTION = 'Description';
  static const String CASTS = 'Casts';

  //App
  static const String CURRENT_THEME = 'theme';

static  List<dynamic> cinemas = [
    {
      "name": "New York",
      "position": LatLng(40.7128, 74.0060),
      "marker": 'assets/images/markers/marker-1.png',
      "image": 'assets/images/avatars/avatar-1.png',
    },
    {
      "name": "Tokyo",
      "position": LatLng(35.6762, 139.6503),
      "marker": 'assets/images/markers/marker-2.png',
      "image": 'assets/images/avatars/avatar-2.png',
    },
    {
      "name": "Cairo",
      "position": LatLng(30.0444, 31.2357),
      "marker": 'assets/images/markers/marker-3.png',
      "image": 'assets/images/avatars/avatar-3.png',
    },
    {
      "name": "Sydny",
      "position": LatLng(33.8688, 151.2093),
      "marker": 'assets/images/markers/marker-4.png',
      "image": 'assets/images/avatars/avatar-4.png',
    },
    {
      "name": "Los Angeles",
      "position": LatLng(34.0549, 118.2426),
      "marker": 'assets/images/markers/marker-5.png',
      "image": 'assets/images/avatars/avatar-5.png',
    },
    {
      "name": "Casablanca",
      "position": LatLng(33.5731, 7.5898),
      "marker": 'assets/images/markers/marker-6.png',
      "image": 'assets/images/avatars/avatar-6.png',
    },
    {
      "name": "Alexandria",
      "position": LatLng(31.2001, 29.9187),
      "marker": 'assets/images/markers/marker-7.png',
      "image": 'assets/images/avatars/avatar-7.png',
    },
  ];
}
