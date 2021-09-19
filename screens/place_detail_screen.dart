import 'package:flutter/material.dart';
import 'package:greetplaces/provider/greet_places.dart';
import 'package:provider/provider.dart';
import '../screens/maps_screen.dart';

class PlaceDetail extends StatelessWidget {

  static const String id = 'place_detail';


  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace = Provider.of<GeeetPlace>(context, listen: false).findById(id);
    return Scaffold(

      appBar: AppBar(title: Text(selectedPlace.title),),
      body: Column(
        children: [
          Container(height: 250,  width: double.infinity, child: Image.file(selectedPlace.image, fit: BoxFit.cover, width: double.infinity, ), ),
          SizedBox(height: 10,),
          Text(selectedPlace.location.address, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.grey),),
          SizedBox(height: 10,),
          TextButton(child: Text("View on Map"),onPressed: () => Navigator.of(context).push(MaterialPageRoute( fullscreenDialog: true, builder: (context) => MapScreen(
            initalLocation: selectedPlace.location, isSelecting: false,

          )))  ,)

        ],
      ),
    );
  }
}
