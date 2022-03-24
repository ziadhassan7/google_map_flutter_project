import 'package:flutter/material.dart';
import 'package:google_map_project/controller/provider/places_menu_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlacesMenuProvider())
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith( //todo customized Colors

              primary: Colors.green.shade50.withOpacity(0.5),
              secondary: Colors.white,
            ),
            canvasColor:
                Colors.white //todo: background color for all application
            ),
        home: HomeScreen(),
      ),
    );
  }
}
