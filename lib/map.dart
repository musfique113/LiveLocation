import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:livelocation/map_location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LiveLocatinTrack()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),

      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(23.80273258793072, 90.359670844069),
          zoom: 15,
          bearing: 30,
        ),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        markers: <Marker>{
          Marker(
            draggable: true,
            markerId: const MarkerId('marker-1'),
            position: const LatLng(23.809564515270853, 90.35555097107054),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: const InfoWindow(
              title: 'My current location',
              // snippet:
              //     'Latitude: 23.81388674225409, Longitude: 90.34664771272887',
            ),
          ),
          Marker(
            draggable: true,
            markerId: const MarkerId('marker-2'),
            position: const LatLng(23.81243067656432, 90.3568384313536),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: const InfoWindow(
              title: 'My current location',
              // snippet:
              //     'Latitude: 23.81388674225409, Longitude: 90.34664771272887',
            ),
          ),
        },
        polylines: <Polyline>{
          Polyline(
              polylineId: PolylineId('trackingLine'),
              color: Colors.blue,
              width: 5,
              points: [
                LatLng(23.81243067656432, 90.3568384313536),
                LatLng(23.809564515270853, 90.35555097107054)
              ]),
        },
      ),
    );
  }
}
