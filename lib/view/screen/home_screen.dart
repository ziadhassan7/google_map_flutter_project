import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_project/controller/gmap_location_route_handler.dart';
import 'package:google_map_project/view/widget/custom_button.dart';
import 'package:google_map_project/view/widget/places_menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/places_menu_provider.dart';
import '../widget/map_viewer.dart';

class HomeScreen extends StatefulWidget {//todo has to be stateful for google maps
  HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ----- Body
      body: Stack(
        alignment: Alignment.topCenter,

        children: [

          ///                                                                   /Google Map Viewer
          Consumer<PlacesMenuProvider>(
            builder: (context, provider, child) {

              return MapViewer(
                isPlacesMenuOpened: provider.isPlacesMenuButtonPressed,
                mainController: _controller,
              );
            },
          ),


          ///                                                                   /Menu - Places Discovery Menu
          Consumer<PlacesMenuProvider>(
            builder: (context, provider, child) {

              //check if menu button is pressed
              return provider.isPlacesMenuButtonPressed ?
                  //if pressed show the menu
                PlacesMenu(mainController: _controller)
                  //if not return an empty widget
                : const SizedBox();

            }
          ),

          ///                                                                   /Top Button - "Discover Places"
          const CustomButton(),
        ],
      ),
      ///


      /// ----- Floating Action Button - get current location
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GMapLocationRoute().goToCurrentLocation(_controller);
        },
        child: Icon(Icons.gps_fixed, color: Colors.green.shade900,),
      ),

    );
  }
}
