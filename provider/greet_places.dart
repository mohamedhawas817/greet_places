import 'package:flutter/foundation.dart';
import 'package:greetplaces/models/place.dart';
import 'dart:io';
import '../helper/db_helper.dart';

class GeeetPlace extends ChangeNotifier {


  List<Place> _places = [];

  List<Place> get items {
    return _places;
  }

  void addPlace(String title, File Picedimage) {
    final newPlace = Place(id: DateTime.now().toString(), title: title, image: Picedimage, location: null);
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image.path});

  }

  Future<void> fetchAndsetPlaces() async {
   final dataList = await DBHelper.getData('user_places');
   _places = dataList.map((item) => Place(id: item['id'], title: item['title'], image: File(item['image']), location: null)).toList();
   notifyListeners();
  }

}