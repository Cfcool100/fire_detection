import 'package:fire_detection/models/capteur_model.dart';
import 'package:fire_detection/models/notification_model.dart';
import 'package:fire_detection/models/user_model.dart';

List<UserModel> admins = [];

final List<UserModel> users = [];

final List<Map<String, dynamic>> zones = [
  {
    'location': 'Centre Medical',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': 'Outillage',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': 'Nouvelle Direction',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': 'Ancienne Direction',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': 'Capitainerie',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': 'Palmeraie',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': '9 kilo',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
  {
    'location': 'Pont piéton',
    'description': 'Situé à 2km du commissariat de police',
    'image': 'images/flood-1.png'
  },
];

List<CapteurModel> capteurs = [
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
    isConnected: true,
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
    isConnected: true,
  ),
];

final List<NotificationModel> allNotifications = <NotificationModel>[
  NotificationModel(
    title: 'Alerte incendie !',
    content:
        'Bonjour, le service incendie nous signalons un incendie dans votre zone.',
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content:
        'Bonjour, un incendie a été signalé près de votre position. Soyez vigilant.',
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content:
        'Attention, un feu de forêt s\'est déclaré à proximité de votre région.',
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content: 'Urgence incendie! Veuillez évacuer la zone immédiatement.',
    date: DateTime.now(),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content:
        'Bonjour, le service incendie signale un feu maîtrisé dans votre secteur.',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content: 'Incendie contrôlé, le risque est sous contrôle. Restez prudent.',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content: 'Un incendie est en cours, l\'équipe est déjà en intervention.',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Alerte incendie !',
    content:
        'Le feu est en cours de gestion. Veuillez éviter la zone concernée.',
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
];
