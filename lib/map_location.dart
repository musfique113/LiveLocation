import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LiveLocatinTrack extends StatefulWidget {
  const LiveLocatinTrack({super.key});

  @override
  State<LiveLocatinTrack> createState() => _LiveLocatinTrackState();
}

class _LiveLocatinTrackState extends State<LiveLocatinTrack> {
  LocationData? myCurrentLocation;
  late StreamSubscription _locationSuscription;


  Future<void> getMyLocation() async {

    //request permission
    await Location.instance.requestPermission();
    myCurrentLocation = await Location.instance.getLocation();
    print(myCurrentLocation);
    if (mounted) {
      setState(() {});
    }
  }

  void listenToMyLocation() {
   _locationSuscription = Location.instance.onLocationChanged.listen((location) {
      if (location != myCurrentLocation) {
        myCurrentLocation = location;
        print('listning to my location $location');
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Live location track"),
          centerTitle: true,
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                getMyLocation();
              },
              child: Icon(Icons.location_on_outlined),
            ),
            SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                listenToMyLocation();
              },
              child: Icon(Icons.pin_drop_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('my location'),
              Text('${myCurrentLocation?.latitude ?? ''} '
                  '${myCurrentLocation?.longitude ?? ''} '),
            ],
          ),
        ));
  }
}
