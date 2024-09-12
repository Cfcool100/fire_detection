import 'package:flutter/foundation.dart';

import 'package:fire_detection/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final List<UserModel> _listAdmins = [
    UserModel(
      firstName: 'Abidu Ali',
      lastName: '',
      role: 'Fonction utilisateur',
    ),
    UserModel(
      firstName: 'Alassane Zakaria',
      lastName: 'Kone',
      role: 'Fonction utilisateur',
    ),
    UserModel(
      firstName: 'Desirée',
      lastName: 'Doh',
      role: 'Fonction utilisateur',
    ),
  ];

  final List<UserModel> _listUsers = [
    UserModel(
      firstName: 'Abdoul Karim',
      lastName: '',
      role: 'Informaticien',
    ),
    UserModel(
      firstName: 'Sako Abdoul Karim',
      lastName: '',
      role: 'Informaticien',
    ),
  ];

  List<UserModel> get adminsUsers => _listAdmins;

  List<UserModel> get users => _listUsers;

  void addAdminUser(UserModel user) {
    _listAdmins.add(user);
    notifyListeners();
  }

  void addUser(UserModel user) {
    _listUsers.add(user);
    notifyListeners();
  }

  void removeAdminUser(UserModel user) {
    _listAdmins.remove(user);
    notifyListeners();
  }

  void modifyUser(UserModel user) {
    final index = _listAdmins.indexWhere((u) => u.id == user.id);

    if (index != -1) {
      _listAdmins[index] = user;
      notifyListeners();
    }
  }
}
