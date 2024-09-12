import 'package:fire_detection/utils/action_sheets.dart';
import 'package:fire_detection/utils/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fire_detection/providers/user_provider.dart';
import 'package:fire_detection/widgets/custom_sliver_search.dart';
import 'package:fire_detection/widgets/custom_tiles.dart';
import 'package:fire_detection/widgets/customs_app_bar.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppListAppBar(
        title: 'Liste des utilisateurs',
        action: () {
          CustomBottomSheet.addNewAccountBottomSheet(context);
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
                  'Utilisateurs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: .5,
                    color: Color(0xff1171D8),
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    '${context.watch<UserProvider>().users.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            CustomSliverSearchBar(),
            Consumer<UserProvider>(builder: (context, provider, _) {
              return SliverList.builder(
                itemCount: provider.users.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CustomListTile(
                    title:
                        '${provider.users[index].lastName} ${provider.users[index].firstName}',
                    description: '(${provider.users[index].role})',
                    onLongPress: () => showAdaptiveActionSheet(
                      context,
                      user: provider.adminsUsers[index],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
