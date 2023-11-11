/*
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movies_riverpod/app/app_constants.dart';

import '../../models/map_style.dart';

class FindCinemas extends StatefulWidget {
  const FindCinemas({ Key? key }) : super(key: key);

  @override
  _FindCinemasState createState() => _FindCinemasState();
}

class _FindCinemasState extends State<FindCinemas> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> _markers = {};
  late GoogleMapController _controller;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createMarkers(context);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            markers: _markers,

            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              controller.setMapStyle(MapStyle().aubergine);
            },
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AppConstants.cinemas.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _controller.moveCamera(CameraUpdate.newLatLng(AppConstants.cinemas[index]["position"]));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppConstants.cinemas[index]['image'], width: 60,),
                          SizedBox(height: 10,),
                          Text(AppConstants.cinemas[index]["name"], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                  );
                },
              )
            ),
          )
        ],
      )
    );
  }

  createMarkers(BuildContext context) {
    Marker marker;

    AppConstants.cinemas.forEach((contact) async {
      marker = Marker(
        markerId: MarkerId(contact['name']),
        position: contact['position'],
        icon: await _getAssetIcon(context, contact['marker']).then((value) => value),

        infoWindow: InfoWindow(
          title: contact['name'],
          snippet: 'Street 6 . 2min ago',
        ),
      );

      setState(() {
        _markers.add(marker);
      });
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(BuildContext context, String icon) async {
    final Completer<BitmapDescriptor> bitmapIcon = Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context, size: Size(5, 5));

    AssetImage(icon)
      .resolve(config)
      .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
        final ByteData? bytes = await image.image.toByteData(format: ImageByteFormat.png);
        final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
        bitmapIcon.complete(bitmap);
      })
    );

    return await bitmapIcon.future;
  }
}
*/
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
// 1. Domain Layer

// domain/entities/location.dart
/*
class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
}

// domain/repositories/location_repository.dart
abstract class LocationRepository {
  Future<Location> getCurrentLocation();
}

// 2. Data Layer

// data/repositories/location_repository_impl.dart


class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getCurrentLocation() async {
    // Implement fetching location data, either from a device sensor or other sources.
    // For simplicity, returning a hardcoded location in this example.
    return Location(latitude: 37.7749, longitude: -122.4194); // San Francisco
  }
}

// 3. Presentation Layer

// presentation/pages/map_page.dart


final locationProvider = FutureProvider<Location>((ref) async {
  final repository = ref.read(locationRepositoryProvider);
  return repository.getCurrentLocation();
});

class MapPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps with Clean Architecture and Riverpod'),
      ),
      body: Center(
        child: locationAsyncValue.when(
          data: (location) => GoogleMap(

            initialCameraPosition: CameraPosition(
              target: LatLng(location.latitude, location.longitude),
              zoom: 12.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('marker_1'),
                position: LatLng(location.latitude, location.longitude),
                infoWindow: InfoWindow(title: 'San Francisco'),
              ),
            },
          ),//Text('Current Location: ${location.latitude}, ${location.longitude}'),
          loading: () => CircularProgressIndicator(),
          error: (error, stackTrace) {
            // Handle error fetching location
            print('Error fetching location: $error');
            return Text('Error fetching location');
          },
        ),
      ),
    );
  }
}

// 4. Dependency Injection

// main.dart


final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepositoryImpl();
});

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Riverpod Example',
      home: MapPage(),
    );
  }
}*/
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/places.dart';

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Cinemas'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Default: San Francisco
          zoom: 12.0,
        ),
        markers: Set<Marker>.from(markers),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _searchNearbyCinemas();
    });
  }

  void _searchNearbyCinemas() async {
    // Replace YOUR_API_KEY with your actual Google Maps API key
    final places = GoogleMapsPlaces(apiKey:"");//
    //

    PlacesSearchResponse response = await places.searchNearbyWithRadius(
      Location(lat: 37.7749, lng: -122.4194), // Default: San Francisco
      50000, // Radius in meters (adjust as needed)
      type: 'movie_theater',
    );

    if (response.isOkay) {
      setState(() {
        markers.clear();
        for (PlacesSearchResult result in response.results) {
          markers.add(
            Marker(
              markerId: MarkerId(result.placeId),
              position: LatLng(
                result.geometry?.location.lat??0,
                result.geometry?.location.lng??0,
              ),
              infoWindow: InfoWindow(
                title: result.name,
                snippet: result.vicinity,
              ),
            ),
          );
        }
      });
    } else {
      // Handle error
      print('Error: ${response.errorMessage}');
    }
  }
}

*/
// main.dart

/*import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(
  ProviderScope(
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}
// presentation/map_screen.dart



final cinemasProvider = FutureProvider<List<Cinema>>((ref) async {
  final searchCinemasUseCase = ref.read(searchCinemasUseCaseProvider);
  return searchCinemasUseCase.execute();
});

final searchCinemasUseCaseProvider = Provider<SearchCinemasUseCase>(
      (ref) => SearchCinemasUseCase(
    cinemaRepository: ref.watch(cinemaRepositoryProvider),
  ),
);

final cinemaRepositoryProvider = Provider<CinemaRepository>(
      (ref) => CinemaRepositoryImpl(
    cinemaApiProvider: ref.watch(cinemaApiProviderProvider),
  ),
);

final cinemaApiProviderProvider = Provider<CinemaApiProvider>(
      (ref) => CinemaApiProvider(apiKey: ''),
);

class MapScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cinemasAsyncValue = ref.watch(cinemasProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Cinemas'),
      ),
      body: cinemasAsyncValue.when(
        data: (cinemas) {
          return buildMapWithMarkers(cinemas);
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          return Center(
            child: Text('Error: $error'),
          );
        },
      ),
    );
  }

  Widget buildMapWithMarkers(List<Cinema> cinemas) {
    // Implement your Google Maps widget here
    // Use the cinemas data to display markers on the map
    // Example: GoogleMap(..., markers: createMarkers(cinemas), ...)
    return Container();
  }
}
// domain/entities/cinema.dart

class Cinema {
  final String id;
  final String name;
  final double latitude;
  final double longitude;

  Cinema({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}
// domain/usecases/search_cinemas.dart



class SearchCinemasUseCase {
  final CinemaRepository cinemaRepository;

  SearchCinemasUseCase({required this.cinemaRepository});

  Future<List<Cinema>> execute() async {
    return cinemaRepository.searchNearbyCinemas();
  }
}
// data/repositories/cinema_repository_impl.dart


class CinemaRepositoryImpl implements CinemaRepository {
  final CinemaApiProvider cinemaApiProvider;

  CinemaRepositoryImpl({required this.cinemaApiProvider});

  @override
  Future<List<Cinema>> searchNearbyCinemas() async {
    // Call the API provider to get data
    final List<Cinema> cinemas = await cinemaApiProvider.fetchNearbyCinemas(37.7749, -122.4194);
    return cinemas;
  }
}
// domain/repositories/cinema_repository.dart


abstract class CinemaRepository {
  Future<List<Cinema>> searchNearbyCinemas();
}
// data/providers/cinema_api_provider.dart



class CinemaApiProvider {
  final String apiKey; // Replace with your Google Maps API key

  CinemaApiProvider({required this.apiKey});

  Future<List<Cinema>> fetchNearbyCinemas(double latitude, double longitude) async {
    final String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
    final int radius = 55000; // 5000 meters (adjust as needed)

    final String url =
        '$baseUrl?location=$latitude,$longitude&radius=$radius&type=movie_theater&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      log(data.toString());
      if (data.containsKey('results')) {
        final List<dynamic> results = data['results'];

        List<Cinema> cinemas = results.map((result) {
          return Cinema(
            id: result['place_id'],
            name: result['name'],
            latitude: result['geometry']['location']['lat'],
            longitude: result['geometry']['location']['lng'],
          );
        }).toList();
          log(cinemas.toString());
        return cinemas;
      }
    }

    throw Exception('Failed to fetch nearby cinemas');
  }
}*/

