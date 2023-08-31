import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Location _location = Location();
  late Marker _marker;
  List<LatLng> _polylineCoordinates = [];
  late Polyline _polyline;

  @override
  void initState() {
    super.initState();
    _initMarker();
    _initPolyline();
    _location.onLocationChanged.listen((LocationData currentLocation) {
      _updateMarkerPosition(currentLocation);
      _updatePolyline(currentLocation);
      if (_mapController != null) {
        _animateToLocation(currentLocation);
      }
    });
  }

  void _initMarker() {
    _marker = Marker(
      markerId: MarkerId('currentLocation'),
      position: LatLng(0, 0),
      infoWindow: InfoWindow(
        title: 'My current location',
        snippet: 'Latitude: 0.0, Longitude: 0.0',
      ),
    );
  }

  void _initPolyline() {
    _polyline = Polyline(
      polylineId: PolylineId('trackingLine'),
      color: Colors.blue,
      width: 5,
      points: _polylineCoordinates,
    );
  }

  void _updateMarkerPosition(LocationData locationData) {
    setState(() {
      _marker = _marker.copyWith(
        positionParam: LatLng(locationData.latitude!, locationData.longitude!),
        infoWindowParam: InfoWindow(
          title: 'My current location',
          snippet:
          'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}',
        ),
      );
    });
  }

  void _updatePolyline(LocationData locationData) {
    setState(() {
      _polylineCoordinates.add(LatLng(locationData.latitude!, locationData.longitude!));
      _polyline = _polyline.copyWith(pointsParam: _polylineCoordinates);
    });
  }

  void _animateToLocation(LocationData locationData) {
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(LatLng(locationData.latitude!, locationData.longitude!)),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Tracker'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0, 0), zoom: 15),
        onMapCreated: _onMapCreated,
        markers: {_marker},
        polylines: {_polyline},
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
      ),
    );
  }
}
