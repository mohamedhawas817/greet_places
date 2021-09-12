import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {


  final String long;
  final String latit;
  String address;

  PlaceLocation({@required this.long, @required this.latit, this.address });

}


class Place {

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({ @required this.id, @required this.title, @required this.image, @required this.location});
}