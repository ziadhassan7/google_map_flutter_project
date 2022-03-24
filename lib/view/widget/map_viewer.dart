import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/gmap_location_route_handler.dart';

class MapViewer extends StatefulWidget {
  MapViewer({Key? key, required this.isPlacesMenuOpened, required this.mainController}) : super(key: key);

  bool isPlacesMenuOpened;
  Completer<GoogleMapController> mainController;

  @override
  State<MapViewer> createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  @override
  Widget build(BuildContext context) {

    return Container(

      ///                                                                       /Shadow Overlay
      foregroundDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isPlacesMenuOpened ? 0.5 : 0.0),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      ///                                                                       /Google Map View
      child: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.hybrid,
        initialCameraPosition: GMapLocationRoute.initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          widget.mainController.complete(controller);
        },
      ),
    );
  }
}
