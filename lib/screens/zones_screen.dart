import 'package:fire_detection/utils/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fire_detection/providers/zone_provider.dart';
import 'package:fire_detection/utils/action_sheets.dart';
import 'package:fire_detection/widgets/custom_sliver_search.dart';
import 'package:fire_detection/widgets/custom_tiles.dart';
import 'package:fire_detection/widgets/customs_app_bar.dart';

class ZonesScreen extends StatelessWidget {
  const ZonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppListAppBar(
        title: 'Liste des zones',
        action: () => CustomBottomSheet.addNewAlertFireBottomSheet(context),
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
                  'Zones',
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
                    '${context.watch<ZoneProvider>().zones.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            CustomSliverSearchBar(),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 50),
              sliver: Consumer<ZoneProvider>(builder: (context, provider, _) {
                return SliverList.builder(
                  itemCount: provider.zones.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: CustomListTile(
                      title: provider.zones[index].location,
                      description: '(${provider.zones[index].description})',
                      tileFilled: true,
                      image: provider.zones[index].image,
                      onLongPress: () => showAdaptiveActionSheetForZoneTile(
                        context,
                        zone: provider.zones[index],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
