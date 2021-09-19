import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:greetplaces/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:greetplaces/provider/greet_places.dart';
import './screens/places_list.dart';
import './screens/add_place_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GeeetPlace(),
      child: MaterialApp(
        title: "Great Places",
        theme:  ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: PlacesList() ,
        routes: {
          AddPlaces.id: (context) => AddPlaces(),
          PlaceDetail.id: (context) => PlaceDetail()
        },
      ),
    );
  }
}
