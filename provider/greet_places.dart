import 'package:flutter/foundation.dart';
import 'package:greetplaces/models/place.dart';
import 'dart:io';
import '../helper/db_helper.dart';
import '../helper/db_location.dart';


class GeeetPlace extends ChangeNotifier {


  List<Place> _places = [];

  List<Place> get items {
    return _places;
  }

  Place findById(String id) {
    return _places.firstWhere((element) => element.id == id);

  }


  Future<void> addPlace(String title, File Picedimage, PlaceLocation pickedLocation) async {
   final address = await LocationHelper.getPlaceAddress(pickedLocation.latit, pickedLocation.long);
   final updatedLocation = PlaceLocation(long: pickedLocation.long, latit: pickedLocation.latit, address: address);
    final newPlace = Place(id: DateTime.now().toString(), title: title, image: Picedimage, location: updatedLocation);
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latit,
      'loc_lng': newPlace.location.long,
      'address': newPlace.location.address

    });

  }

  Future<void> fetchAndsetPlaces() async {
   final dataList = await DBHelper.getData('user_places');
   _places = dataList.map((item) =>
       Place(id: item['id'],
           title: item['title'],
           image: File(item['image']),
           location: PlaceLocation(long: item['loc_lng'] , latit: item['loc_lat'], address: item['address']),

       )).toList();
   notifyListeners();
  }

}