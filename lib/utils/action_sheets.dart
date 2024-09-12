import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'package:fire_detection/models/user_model.dart';
import 'package:fire_detection/models/zone_model.dart';
import 'package:fire_detection/providers/user_provider.dart';
import 'package:fire_detection/utils/bottom_sheets.dart';

void showAdaptiveActionSheet(BuildContext context, {required UserModel user}) {
  if (Platform.isAndroid) {
    // Afficher CupertinoActionSheet pour iOS
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        // title: const Text('Options'),

        message: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Sélectionnez une option',
            style: TextStyle(
              color: Color(0xff1171D8),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              CustomBottomSheet.addNewAccountBottomSheet(context, user: user);
            },
            child: const Text('Modifier'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              if (user.role == 'Administrateur' ||
                  user.role == 'Fonction utilisateur') {
                log(user.role);
                context.read<UserProvider>().removeAdminUser(user);
                Navigator.pop(context);
              }
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  } else {
    // Afficher BottomSheet pour Android
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Modifier'),
              onTap: () {
                Navigator.pop(context);
                debugPrint('Modifier');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever),
              title: const Text('Supprimer'),
              onTap: () {
                // context.read<UserProvider>().removeAdminUser(user);
                // Navigator.pop(context);
                debugPrint('Supprimer');
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void showAdaptiveActionSheetForZoneTile(BuildContext context,
    {required ZoneModel zone}) {
  if (Platform.isAndroid) {
    // Afficher CupertinoActionSheet pour iOS
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        // title: const Text('Options'),
        message: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Sélectionnez une option',
            style: TextStyle(
              color: Color(0xff1171D8),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              // CustomBottomSheet.addNewAccountBottomSheet(context, user: user);
              Navigator.pop(context);
            },
            child: const Text('Ouvrir'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // CustomBottomSheet.addNewAccountBottomSheet(context, user: user);
              Navigator.pop(context);
            },
            child: const Text('Sélection multiple'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // CustomBottomSheet.addNewAccountBottomSheet(context, user: user);
              Navigator.pop(context);
            },
            child: const Text('Modifier'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // if (user.role == 'Administrateur' ||
              //     user.role == 'Fonction utilisateur') {
              //   log(user.role);
              //   context.read<UserProvider>().removeAdminUser(user);
              //   Navigator.pop(context);
              // }
              Navigator.pop(context);
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  } else {
    // Afficher BottomSheet pour Android
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Modifier'),
              onTap: () {
                Navigator.pop(context);
                debugPrint('Modifier');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever),
              title: const Text('Supprimer'),
              onTap: () {
                // context.read<UserProvider>().removeAdminUser(user);
                // Navigator.pop(context);
                debugPrint('Supprimer');
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void showAdaptiveActionSheetForCaptorTile(BuildContext context,
    {required ZoneModel captor}) {
  if (Platform.isAndroid) {
    // Afficher CupertinoActionSheet pour iOS
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        // title: const Text('Options'),
        message: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Sélectionnez une option',
            style: TextStyle(
              color: Color(0xff1171D8),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              // CustomBottomSheet.addNewAccountBottomSheet(context, user: user);
              Navigator.pop(context);
            },
            child: const Text('Modifier'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // if (user.role == 'Administrateur' ||
              //     user.role == 'Fonction utilisateur') {
              //   log(user.role);
              //   context.read<UserProvider>().removeAdminUser(user);
              //   Navigator.pop(context);
              // }
              Navigator.pop(context);
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  } else {
    // Afficher BottomSheet pour Android
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Modifier'),
              onTap: () {
                Navigator.pop(context);
                debugPrint('Modifier');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever),
              title: const Text('Supprimer'),
              onTap: () {
                // context.read<UserProvider>().removeAdminUser(user);
                // Navigator.pop(context);
                debugPrint('Supprimer');
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
