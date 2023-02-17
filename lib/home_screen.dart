import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGoohleplex = const CameraPosition(
    target: LatLng(24.59540677214331, 73.66501277695039),
    zoom: 13,
  );

  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(24.59540677214331, 73.66501277695039),
    LatLng(24.591685652559054, 73.65213588138819),
    LatLng(24.601134413619203, 73.69141198776033),
    LatLng(24.58444564713291, 73.68607265255201),
    LatLng(24.59540677214331, 73.66501277695039),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(Polygon(
      polygonId: PolygonId('1'),
      points: points,
      fillColor: Colors.red,
      geodesic: true,
      strokeWidth: 4,
      strokeColor: Colors.red.withOpacity(0.4),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Polygon"),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGoohleplex,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        polygons: _polygon,
        // markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
