import 'package:fire_detection/models/capteur_model.dart';
import 'package:flutter/foundation.dart';

class CapteurProvider extends ChangeNotifier {
  final List<CapteurModel> _capteurs = [
    CapteurModel(
      name: 'Code-St',
      zone: 'Situé à 2km du commissariat de police',
      installationDate: DateTime.now(),
      isConnected: true,
    ),
    CapteurModel(
      name: 'Unix',
      zone: 'Situé à 2km du commissariat de police',
      installationDate: DateTime.now(),
      isConnected: false,
    ),
    CapteurModel(
      name: 'Comos',
      zone: 'Situé à 2km du commissariat de police',
      installationDate: DateTime.now(),
      isConnected: true,
    ),
    CapteurModel(
      name: 'Boot',
      zone: 'Situé à 2km du commissariat de police',
      installationDate: DateTime.now(),
      isConnected: false,
    ),
  ];

  List<CapteurModel> get capteurs => _capteurs;
}
