// ignore_for_file: unnecessary_const

import 'package:fire_detection/models/user_model.dart';
import 'package:fire_detection/providers/user_provider.dart';
import 'package:fire_detection/widgets/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

// String? _selectedRole;
String? _selectedZone;
String? _selectedStatus;
final List<String> _roles = [
  'Administrateur',
  'Fonction utilisateur',
  'Informaticien'
];
final List<String> _status = ['faible', 'moyen', 'grave'];

final List<String> _zones = [
  'Centre Medical',
  'Outillage',
  'Nouvelle Direction',
  'Ancienne Direction',
  'Capitainerie',
  'Palmeraie',
  '9 kilo',
  'Pont piéton',
];

TextEditingController _firstName = TextEditingController();
TextEditingController _lastName = TextEditingController();

// TextEditingController _zone = TextEditingController();
// TextEditingController _status = TextEditingController();

class CustomBottomSheet {
  static Future<dynamic> addNewAccountBottomSheet(BuildContext context,
      {UserModel? user}) {
    _firstName.text = user?.firstName ?? '';
    _lastName.text = user?.lastName ?? '';
    String? _selectedRole = user?.role;
    return showCupertinoModalBottomSheet(
      context: context,
      expand: true,
      isDismissible: true,
      builder: (context) => Material(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xff1171D8),
                    ),
                    child: const Text(
                      'Nouveau compte',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[500],
                          child: const Icon(
                            Icons.person_rounded,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          controller: _lastName,
                          decoration: const InputDecoration(
                            labelText: "Nom de l'utilisateur",
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _firstName,
                          decoration: const InputDecoration(
                            labelText: "Prénom de l'utilisateur",
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          style: const TextStyle(
                            // color: Color(0xff1171D8),
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          // isExpanded: true,
                          isDense: false,
                          hint: const Text(
                            'Sélectionnez un rôle',
                            style: TextStyle(
                              color: Color(0xff1171D8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                            constraints: BoxConstraints(maxHeight: 48),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 45, minHeight: 15),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color(0xff1171D8),
                              size: 45,
                            ),
                          ),
                          value: _selectedRole ?? user?.role,
                          alignment: Alignment.center,
                          icon: null,
                          iconSize: 0,
                          onChanged: (String? newValue) {
                            // setState(() {
                            _selectedRole = newValue;
                            // });
                          },
                          items: _roles.map((String role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
                child: MaterialButton(
                  onPressed: () {
                    if (user == null &&
                            _selectedRole != null &&
                            _selectedRole == _roles[0] ||
                        _selectedRole == _roles[1]) {
                      context.read<UserProvider>().addAdminUser(
                            UserModel(
                              firstName: _firstName.text.trim(),
                              lastName: _lastName.text.trim(),
                              role: '$_selectedRole',
                            ),
                          );

                      Navigator.of(context).pop();
                    } else if (user == null &&
                        _selectedRole != null &&
                        _selectedRole != _roles[0]) {
                      context.read<UserProvider>().addUser(
                            UserModel(
                              firstName: _firstName.text.trim(),
                              lastName: _lastName.text.trim(),
                              role: '$_selectedRole',
                            ),
                          );

                      Navigator.of(context).pop();
                    } else if (user != null) {
                      context.read<UserProvider>().modifyUser(
                            UserModel(
                              firstName: _firstName.text.trim(),
                              lastName: _lastName.text.trim(),
                              role: '$_selectedRole',
                            ),
                          );
                    }

                    _firstName.clear();
                    _lastName.clear();
                    _selectedRole = null;
                  },
                  color: const Color(0XFF3b82f6),
                  elevation: 0,
                  highlightElevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ajouter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<dynamic> addNewAlertFireBottomSheet(BuildContext context) {
    _firstName.text = '';
    _lastName.text = '';
    // _zone.text = '';
    // _status.text = '';

    // void _showDatePicker(BuildContext context) {
    //   showCupertinoModalPopup(
    //     context: context,
    //     builder: (_) => Container(
    //       height: 250,
    //       color: const Color.fromARGB(255, 255, 255, 255),
    //       child: Column(
    //         children: [

    //           CupertinoButton(
    //             child: const Text('OK'),
    //             onPressed: () => Navigator.of(context).pop(),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return showCupertinoModalBottomSheet(
      context: context,
      expand: true,
      builder: (context) => Material(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xff1171D8),
                    ),
                    child: const Text(
                      'Declarer un incendie',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.local_fire_department_rounded,
                            size: 80,
                            color: Color(0xffF04444),
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          controller: _lastName,
                          decoration: const InputDecoration(
                            labelText: "Nom de l'utilisateur",
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _firstName,
                          decoration: const InputDecoration(
                            labelText: "Prénom de l'utilisateur",
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          style: const TextStyle(
                            // color: Color(0xff1171D8),
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          // isExpanded: true,
                          isDense: false,
                          hint: const Text(
                            'Sélectionnez une zone',
                            style: TextStyle(
                              color: Color(0xff1171D8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                            constraints: BoxConstraints(maxHeight: 48),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 45, minHeight: 15),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color(0xff1171D8),
                              size: 45,
                            ),
                          ),
                          value: _selectedZone,
                          alignment: Alignment.centerLeft,
                          icon: null,
                          iconSize: 0,
                          onChanged: (String? newValue) {
                            // setState(() {
                            _selectedZone = newValue;
                            // });
                          },
                          items: _zones.map((String role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          style: const TextStyle(
                            // color: Color(0xff1171D8),
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          isExpanded: false,
                          disabledHint: Container(),
                          isDense: false,
                          padding: EdgeInsets.zero,
                          hint: const Text(
                            'Sélectionnez l’état de l\'incendie',
                            style: TextStyle(
                              color: Color(0xff1171D8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                            constraints: BoxConstraints(maxHeight: 48),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 45, minHeight: 15),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color(0xff1171D8),
                              size: 45,
                            ),
                          ),
                          value: _selectedStatus,
                          alignment: Alignment.centerLeft,
                          icon: Container(),
                          iconSize: 0,
                          onChanged: (String? newValue) {
                            // setState(() {
                            _selectedZone = newValue;
                            // });
                          },
                          items: _status.map((String role) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.centerLeft,
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color(0XFF3b82f6),
                  elevation: 0,
                  highlightElevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Déclarer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<dynamic> addNewCaptorBottomSheet(BuildContext context) {
    bool isConnected = false;
    DateTime? selectedDate;
    void showDatePicker(
        BuildContext context, Function(DateTime?) onDateSelected) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 250,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate ??
                      DateTime.now().subtract(const Duration(days: 1)),
                  onDateTimeChanged: (DateTime newDate) {
                    onDateSelected(newDate);
                  },
                ),
              ),
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () =>
                    Navigator.of(context).pop(selectedDate ?? DateTime.now()),
              ),
            ],
          ),
        ),
      );
    }

    return showCupertinoModalBottomSheet(
      context: context,
      expand: true,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return Material(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xff1171D8),
                      ),
                      child: const Text(
                        'Nouveau capteur',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            height: 95,
                            width: 95,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(55),
                              color: const Color(0xff3B82F6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                'images/capteur-icon.png',
                                // color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: "Nom du capteur",
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            style: const TextStyle(
                              // color: Color(0xff1171D8),
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            // isExpanded: true,
                            isDense: false,
                            hint: const Text(
                              'Sélectionnez une zone',
                              style: TextStyle(
                                color: Color(0xff1171D8),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.zero,
                              constraints: BoxConstraints(maxHeight: 48),
                              suffixIconConstraints:
                                  BoxConstraints(maxHeight: 45, minHeight: 15),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xff1171D8),
                                size: 45,
                              ),
                            ),
                            value: _selectedZone,
                            alignment: Alignment.center,
                            icon: null,
                            iconSize: 0,
                            onChanged: (String? newValue) {
                              _selectedZone = newValue;
                              // });
                            },
                            items: _zones.map((String role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () =>
                                showDatePicker(context, (DateTime? newDate) {
                              setState(() {
                                selectedDate = newDate;
                              });
                            }),
                            child: Tile(
                              title: 'Date d\'installation',
                              trailing: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedDate == null
                                          ? "-- / -- / ----"
                                          : DateFormat('dd/MM/yyyy')
                                              .format(selectedDate!),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.access_time,
                                        color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Tile(
                            title: 'Connectivité',
                            trailing: customSwitch(
                              value: isConnected,
                              onChanged: (value) {
                                setState(() {
                                  isConnected = value;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
                  child: MaterialButton(
                    onPressed: () {},
                    color: const Color(0XFF3b82f6),
                    elevation: 0,
                    highlightElevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ajouter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.title,
    required this.trailing,
  });

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0xff1171D8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          trailing
        ],
      ),
    );
  }
}
