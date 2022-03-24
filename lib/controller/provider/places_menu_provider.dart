import 'package:flutter/widgets.dart';

class PlacesMenuProvider extends ChangeNotifier {

  bool isPlacesMenuButtonPressed = false;

   void updateMenuStatus () {

     if (isPlacesMenuButtonPressed) {
       isPlacesMenuButtonPressed = false;

     } else {
       isPlacesMenuButtonPressed = true;
     }

     notifyListeners();
   }

}