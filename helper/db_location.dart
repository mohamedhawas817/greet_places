
const YOUR_API_KEY = 'AI32423rFSDFSdsdfsdQ3';


class LocationHelper {
  static String generateLocationPreviewImage({double lat, double long}) {

    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%$lat,$long&key=$YOUR_API_KEY';

  }
}