class CapteurModel {
  final String name;
  final String zone;
  final DateTime installationDate;
  final bool isConnected;
  final String icon;

  CapteurModel({
    required this.name,
    required this.zone,
    required this.installationDate,
    required this.isConnected,
    this.icon = 'images/capteur-icon.png',
  });
}
