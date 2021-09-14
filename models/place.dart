import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {


  final double long;
  final double latit;
  final String address;

  const PlaceLocation({@required this.long, @required this.latit, this.address });

}


class Place {

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({ @required this.id, @required this.title, @required this.image, @required this.location});
}