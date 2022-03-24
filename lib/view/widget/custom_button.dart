import 'package:flutter/material.dart';
import 'package:google_map_project/controller/provider/places_menu_provider.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///                                                                         /Padding
    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 15, right: 15),


      ///                                                                       /Size
      child: SizedBox(
        width: double.infinity,
        height: 50,

        ///                                                                     /Button Body
        child: ElevatedButton(
          //onPress
          onPressed: Provider
              .of<PlacesMenuProvider>(context, listen: false).updateMenuStatus,

          //Text
          child: const Text("Discover Places",

            style: TextStyle(
              color: Colors.black54,
              fontSize: 20
            ),),
        ),
      ),
    );
  }
}
