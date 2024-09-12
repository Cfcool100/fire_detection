class UserModel {
  static int _idCounter = 1;

  final int id;
  late final String firstName;
  late final String lastName;
  late final String role;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.role,
  }) : id = _idCounter++;
}
