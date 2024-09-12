import 'package:fire_detection/models/zone_model.dart';
import 'package:flutter/foundation.dart';

class ZoneProvider extends ChangeNotifier {
  final List<ZoneModel> _zones = [
    ZoneModel(
      location: 'Centre Medical',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: 'Outillage',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: 'Nouvelle Direction',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: 'Ancienne Direction',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: 'Capitainerie',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: 'Palmeraie',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: '9 kilo',
      description: 'Situé à 2km du commissariat de police',
    ),
    ZoneModel(
      location: 'Pont piéton',
      description: 'Situé à 2km du commissariat de police',
    ),
  ];

  List<ZoneModel> get zones => _zones;
}
