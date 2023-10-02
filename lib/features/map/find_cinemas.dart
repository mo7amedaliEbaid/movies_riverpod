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
