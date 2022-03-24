import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_project/controller/data/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../controller/data/data.dart';
import '../../controller/gmap_location_route_handler.dart';
import '../../controller/provider/places_menu_provider.dart';

class PlacesMenu extends StatelessWidget {
  PlacesMenu({Key? key, required this.mainController}) : super(key: key);

  Completer<GoogleMapController> mainController;

  @override
  Widget build(BuildContext context) {

    ///                                                                         /Padding
    return Padding(
        padding: const EdgeInsets.only(top: 55.5, left: 15, right: 15),

        ///                                                                     /Inkwell - Handle Taping
        child: InkWell(
          onTap: Provider
              .of<PlacesMenuProvider>(context, listen: false).updateMenuStatus,

          ///                                                                   /Column - (list full screen)
          child: Column(
            children: [

              ///                                                               /Background color and Radius
              Container(
                padding: const EdgeInsets.only(top: 15),
                  height: placesList.length * 73 ,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),


                  ///                                                           /List Widget
                  child: ListView.builder(
                      itemCount: placesList.length,
                      itemBuilder: (context, index) {

                        return ListTile(
                          //child
                          title: Text(placesList[index][NAME]),

                          //onTap
                          onTap: (){
                            GMapLocationRoute().goToLocation(
                                mainController: mainController,
                                latLng: LatLng(placesList[index][LAT], placesList[index][LONG])
                            );

                            Provider
                                .of<PlacesMenuProvider>(context, listen: false).updateMenuStatus();
                          },
                        );
                      })
              ),
            ],
          ),
        )
    );
  }
}
