import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map/models/place.dart';
import 'package:map/screens/search.dart';
import 'package:map/sevices/geolocater_service.dart';
import 'package:map/sevices/places_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorservice();
  final Places_service = PlacesService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
            create: (context) => locatorService.getLocation(),
            initialData: null),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return Places_service.getPlaces(
                position.latitude, position.longitude);
          },
        )
      ],
      child: MaterialApp(
        title: 'Parking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}
