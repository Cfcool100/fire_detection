import 'package:fire_detection/models/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import 'package:fire_detection/dummy.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppWithBottomTab(),
        body: TabBarView(
          children: [
            RecentNotifications(),
            MissedNotifications(),
          ],
        ),
      ),
    );
  }
}

class AppWithBottomTab extends StatelessWidget implements PreferredSizeWidget {
  const AppWithBottomTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          CupertinoIcons.arrow_left_circle_fill,
          size: 35,
        ),
      ),
      title: const Text('Notifications'),

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.white, // Background color for TabBar
          child: const TabBar(
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff1171D8),
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                icon: Text('Récentes'),
              ),
              Tab(
                icon: Text('Manquées'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Badge.count(
            largeSize: 23,
            padding: const EdgeInsets.fromLTRB(7.5, 2, 7.5, 2),
            isLabelVisible: users.isNotEmpty,
            count: 2,
            child: const Icon(CupertinoIcons.bell),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.8);
}

class RecentNotifications extends StatelessWidget {
  const RecentNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: allNotifications.length,
      itemBuilder: (context, index) {
        final notification = allNotifications[index];
        return NotificationTile(notification: notification);
      },
    );
  }
}

// Widget to display missed notifications (for this example, using the same data)
class MissedNotifications extends StatelessWidget {
  const MissedNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount:
          allNotifications.length > 3 ? 2 : 1, // Example for missed count
      itemBuilder: (context, index) {
        final notification = allNotifications[index];
        return NotificationTile(notification: notification);
      },
    );
  }
}

// Widget to display each notification item
class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.local_fire_department,
        color: Colors.red,
        size: 35,
      ),
      horizontalTitleGap: 5,
      title: Text(
        notification.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        notification.content,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      // trailing: Text(
      //   DateFormat('dd/MM/yyyy').format(notification.date),
      //   style: const TextStyle(color: Colors.grey),
      // ),
    );
  }
}
