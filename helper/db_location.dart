import 'package:http/http.dart' as http;
import 'dart:convert';

const YOUR_API_KEY = 'AI32423rFSDFSdsdfsdQ3';


class LocationHelper {

  static String generateLocationPreviewImage({double lat, double long}) {

    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%$lat,$long&key=$YOUR_API_KEY';
  }
  static Future<String> getPlaceAddress(double lat, double lng) async {

    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$YOUR_API_KEY');
    final response = await http.get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];

  }
}