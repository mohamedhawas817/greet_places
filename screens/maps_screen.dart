import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';


class MapScreen extends StatefulWidget {

  final PlaceLocation initalLocation;
  final bool isSelecting;

  MapScreen({this.initalLocation = const PlaceLocation(latit: 37.422, long: -122.084), this.isSelecting = false});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {

    LatLng _pickedLocation;

    void _selectplace(LatLng poisition) {

      setState(() {
        _pickedLocation = poisition;
      });

    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Map"),
        actions: [
          if(widget.isSelecting) IconButton(onPressed: _pickedLocation ==null ?null : (){
            Navigator.of(context).pop(_pickedLocation);
          },
              icon: Icon(Icons.check)
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition:CameraPosition(
          target: LatLng(widget.initalLocation.latit, widget.initalLocation.long),
          zoom: 16
        ),
        onTap: widget.isSelecting ? _selectplace : null,
        markers:  _pickedLocation==null ? null: {
          Marker(markerId: MarkerId('m1'), position: _pickedLocation)
        },

      ),
    );
  }
}
