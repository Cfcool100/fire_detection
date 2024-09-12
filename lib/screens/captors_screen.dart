import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fire_detection/dummy.dart';
import 'package:fire_detection/utils/bottom_sheets.dart';
import 'package:fire_detection/widgets/custom_sliver_search.dart';
import 'package:fire_detection/widgets/customs_app_bar.dart';

class CaptorsScreen extends StatelessWidget {
  const CaptorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppListAppBar(
        title: 'Listes des capteurs',
        action: () {
          CustomBottomSheet.addNewCaptorBottomSheet(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: CustomScrollView(
          controller: ScrollController(),
          slivers: [
            SliverToBoxAdapter(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                title: const Text(
                  'Capteurs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: .5,
                    color: Color(0xff1171D8),
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    '${capteurs.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            CustomSliverSearchBar(),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 50),
              sliver: SliverList.builder(
                itemCount: capteurs.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10),
                  child: CaptorCard(
                    title: capteurs[index].name,
                    zone: '(${capteurs[index].zone})',
                    installationDate: capteurs[index].installationDate,
                    isConnected: capteurs[index].isConnected,
                    icon: capteurs[index].icon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaptorCard extends StatelessWidget {
  const CaptorCard({
    super.key,
    required this.title,
    required this.zone,
    required this.icon,
    required this.installationDate,
    required this.isConnected,
  });

  final String title;
  final String icon;
  final String zone;
  final DateTime installationDate;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: const Color(0xFF3090F6),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: 60,
            margin: const EdgeInsets.only(left: 5, top: 5, right: 10),
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color:
                  // Colors.red :
                  const Color(0xff3B82F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(icon),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cap 1(Entrée)',
                style: TextStyle(
                  color: Color(0xFF3090F6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Zone du capteur : Centre Médicale',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Date d\'installation : ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Connectivité : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(),
                      ),
                    ),
                    child: Icon(
                      Icons.circle_rounded,
                      size: 20,
                      color: isConnected ? Colors.green : Colors.red,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
