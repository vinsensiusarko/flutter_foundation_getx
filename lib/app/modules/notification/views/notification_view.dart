/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 13:54
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/util/dimensions.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: 100,
            centerTitle: false,
            leading: LayoutBuilder(
              builder: (context, constraints) {
                final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
                final deltaExtent = settings!.maxExtent - settings.minExtent;
                final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);
                return Opacity(
                  opacity: t,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: t > 0.5 ? () => Navigator.pop(context) : null,
                  ),
                );
              },
            ),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
                final deltaExtent = settings!.maxExtent - settings.minExtent;
                final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);
                return Container(
                  decoration: BoxDecoration(
                    color: Color.lerp(
                      Colors.white,
                      Colors.blue.shade500,
                      t,
                    ),
                  ),
                  child: FlexibleSpaceBar(
                    titlePadding: EdgeInsetsDirectional.only(
                      start: 16 + (40 * t),
                      bottom: 16,
                    ),
                    centerTitle: false,
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: Color.lerp(Colors.black, Colors.white, t),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
            actions: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
                  final deltaExtent = settings!.maxExtent - settings.minExtent;
                  final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);
                  return Container(
                    decoration: BoxDecoration(
                      color: Color.lerp(
                        Colors.white,
                        Colors.blue.shade500,
                        t,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius12),
                          ),
                        ),
                        side: WidgetStatePropertyAll<BorderSide>(
                          BorderSide(
                            color: Color.lerp(Colors.blue.shade500, Colors.white, t)!,
                            width: 0.5,
                          )
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(
                        'Mark all read',
                        style: TextStyle(
                          color: Color.lerp(Colors.blue.shade500, Colors.white, t),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          SliverToBoxAdapter(
            child: _buildSectionHeader('Today'),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 2,
                (context, index) {
                  return _buildNotificationItem(
                    icon: Icons.shopping_bag_outlined,
                    iconColor: Colors.orange,
                    title: "Paket Terkirim #$index",
                    description: "Pesananmu sudah sampai di tujuan, Bro.",
                    time: "2h ago",
                    isUnread: index == 0,
                  );
                }
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _buildSectionHeader("Yesterday"),
          ),
          /// 5. List Notif Kemarin
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) {
                  return _buildNotificationItem(
                    icon: Icons.local_offer_outlined,
                    iconColor: Colors.blue,
                    title: "Promo Spesial Kemarin",
                    description: "Jangan lewatkan diskon up to 80% khusus user setia.",
                    time: "1d ago",
                    isUnread: false,
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 50),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String time,
    required bool isUnread,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: isUnread ? Colors.blue[100]!.withValues(alpha: 0.3) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: CircleAvatar(
            backgroundColor: iconColor.withValues(alpha: 0.1),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: TextStyle(color: Colors.grey[400], fontSize: 10)),
              if (isUnread) ...[
                const SizedBox(height: 4),
                const CircleAvatar(radius: 4, backgroundColor: Colors.red),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
