import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Completer<GoogleMapController>? _controller = Completer();

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6841, 72.9734), zoom: 14);

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller!.complete();
    super.dispose();
  }

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6841, 72.9734),
        infoWindow: InfoWindow(title: 'My Postion')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.7388045, 73.084488),
        infoWindow: InfoWindow(title: 'E 11 Sector')),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(33.6762, 139.6503),
        infoWindow: InfoWindow(title: 'japan')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_marker),
          compassEnabled: true,
          onMapCreated: ((GoogleMapController? controller) =>
              _controller!.complete()),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.location_disabled_outlined),
      //   onPressed: () async {
      // final GoogleMapController controller = await _controller.future;
      // controller.animateCamera(CameraUpdate.newCameraPosition(
      //     CameraPosition(target: LatLng(24.860966, 66.990501), zoom: 14)));

      // setState(() {});
      // },
      // ),
    );
  }
}
