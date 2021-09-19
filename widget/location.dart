import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../helper/db_location.dart';
import '../screens/maps_screen.dart';

class LocationInput extends StatefulWidget {

  final Function _selectplace;

  LocationInput(this._selectplace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final previewUrl = LocationHelper.generateLocationPreviewImage(lat:lat, long: lng );

    setState(() {
      _previewImageUrl = previewUrl;
    });
  }


  Future<void> _getCurrentLocation() async {

    try {
      final locData = await Location().getLocation();
      print(locData);
      _showPreview(locData.latitude, locData.longitude);

      widget._selectplace(locData.latitude, locData.longitude);

    } catch(err){
      return;
    }


  }

  Future<void> _onSelectmap() async {
    final LatLng selectedLocation = await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      fullscreenDialog: true,
        builder:
            (context) => MapScreen(isSelecting: true, )
    ),
    );
    if(selectedLocation==null) {
      return;
    }
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);

    widget._selectplace(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1)
            ),
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
            child:_previewImageUrl == null ?
            Text("No Location Chosen", textAlign: TextAlign.center,):
            Image.network(_previewImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            )  ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon( icon: Icon(Icons.location_on),

                  label: Text('Current Location', style: TextStyle(color: Theme.of(context).primaryColor),),
                onPressed: _getCurrentLocation,
              ),
              TextButton.icon( icon: Icon(Icons.map),

                label: Text('Select on Map', style: TextStyle(color: Theme.of(context).primaryColor),),
                onPressed: _onSelectmap,
              ),
            ],
          )
        ],
    );
  }
}
