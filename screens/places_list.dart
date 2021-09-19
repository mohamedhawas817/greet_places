import 'package:flutter/material.dart';
import 'package:greetplaces/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';
import '../provider/greet_places.dart';

class PlacesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, AddPlaces.id);
          }, icon: Icon(Icons.add))
        ],

      ),
      body: FutureBuilder(
        future: Provider.of<GeeetPlace>(context, listen: false).fetchAndsetPlaces() ,
        builder: (context, snapShot) => snapShot.connectionState == ConnectionState.waiting ? CircularProgressIndicator(): Consumer<GeeetPlace>(child: Center(
          child: Text("Go To no place yet, start adding some"),
        ), builder: (context, data, child) => data.items.length <=0 ? child: ListView.builder(
          itemCount: data.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(backgroundImage: FileImage(data.items[index].image),),
              title: Text(data.items[index].title),
              subtitle: Text(data.items[index].location.address),
              onTap: () {
                Navigator.of(context).pushNamed(PlaceDetail.id, arguments: data.items[index].id);
              },
            ),
        )  ),
      )
    );
  }
}
