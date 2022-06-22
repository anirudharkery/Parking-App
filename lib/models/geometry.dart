import 'package:map/models/location.dart';

class Geometry {
  final Location location;

  Geometry({required this.location});

  Geometry.fromJsaon(Map<dynamic, dynamic> parsedJson)
      : location = Location.fromJson(parsedJson['location']);
}
