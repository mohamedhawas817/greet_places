import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/image_input.dart';
import 'dart:io';
import '../provider/greet_places.dart';
import 'package:path_provider/path_provider.dart';


class AddPlaces extends StatefulWidget {

  static const String id = "add_place";

  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {

  final _key = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File _pickedImage;

  void selectImage(File pickedFile) {
    _pickedImage = pickedFile;
  }

  void _savePlace() {
    if(_titleController.text.isEmpty || _pickedImage == null) {
          return;
    }
    Provider.of<GeeetPlace>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.pop(context);
    print("got here");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Place"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Title"
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(),
                    ImageInput(selectImage)

                  ],
                ),
              ),
            ),
          ),
          Text("User Inputs"),
          ElevatedButton.icon(onPressed: (){_savePlace();}, icon: Icon(Icons.add),label: Text("Add Place"),  )
        ],
      ),
    );

  }
}
// Form(
//   key:_key ,
//   child: ,
// )