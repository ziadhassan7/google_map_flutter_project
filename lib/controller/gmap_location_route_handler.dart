import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'gps_current_location_handler.dart';

class GMapLocationRoute {

  ///                                                                           /Initial Camera Position
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 10,
  );


  ///                                                                           /Get Current Location
  Future<void> goToCurrentLocation(mainController) async{

    //check for permission and get current location
    Position position = await GPSCurrentLocation().determinePosition();

    //current location latitude and longitude values
    CameraPosition _location = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 18);

    //moves camera to current position
    final GoogleMapController controller = await mainController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_location));
  }


  ///                                                                           /Go to specified location
  Future<void> goToLocation({required mainController, required LatLng latLng}) async{

    //current location latitude and longitude values
    CameraPosition _location = CameraPosition(
        target: latLng,
        zoom: 14.4746);

    //moves camera to current position
    final GoogleMapController controller = await mainController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_location));
  }
}