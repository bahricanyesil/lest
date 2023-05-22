import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lest/product/constants/image_paths.dart';

class MapView extends StatelessWidget {
  const MapView({required this.lat, required this.long, super.key});
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    final markerPoint = LatLng(lat, long);
    return FlutterMap(
      options: MapOptions(center: markerPoint, maxZoom: 19),
      children: <Widget>[
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.cmpe.lest',
        ),
        MarkerLayer(
          markers: <Marker>[
            Marker(
              width: 20,
              height: 20,
              point: markerPoint,
              builder: (_) => Image.asset(ImagePaths.locationMarker),
            ),
          ],
        ),
      ],
    );
  }
}
