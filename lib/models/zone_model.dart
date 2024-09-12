class ZoneModel {
  final String location;
  final String description;
  final String image;

  ZoneModel({
    required this.location,
    required this.description,
    this.image = 'images/flood-1.png',
  });
}
