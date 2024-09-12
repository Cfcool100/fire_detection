import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.arrow_left_circle_fill,
            size: 35,
          ),
        ),
        title: const Text('Profil'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .28,
            width: double.maxFinite,
            color: const Color(0xff1171D8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        const SizedBox(height: 130, width: 130),
                        Positioned(
                          child: Container(
                            width: 124.15,
                            height: 124.15,
                            padding: const EdgeInsets.all(3),
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'images/flood-1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(
                                  side: BorderSide(
                                width: 2,
                                color: Colors.white,
                              )),
                              color: Color(0xFF3090F6),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onPressed: () {
                                // Add edit functionality here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Doh Desirée',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'dohdesiree14@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const CardTile(
            title: 'Informations Personnelles',
            leading: Icons.edit,
            trailing: Icons.arrow_forward_rounded,
          ),
          const CardTile(
            title: 'Modification du mot de passe',
            leading: CupertinoIcons.lock_fill,
            trailing: Icons.arrow_forward_rounded,
          ),
          const CardTile(
            title: 'Se déconnecter',
            leading: Icons.exit_to_app_rounded,
            bgColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.title,
    required this.leading,
    this.trailing,
    this.bgColor = const Color(0xff1171D8),
  });

  final String title;
  final IconData leading;
  final IconData? trailing;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      color: bgColor,
      child: ListTile(
        minTileHeight: 50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Icon(
          leading,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          trailing,
          color: Colors.white,
        ),
      ),
    );
  }
}
