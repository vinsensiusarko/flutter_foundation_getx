/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 14:07
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/util/dimensions.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/home_controller.dart';

class HomeMobile extends StatelessWidget {
  final HomeController controller;
  const HomeMobile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF2A5298),
            expandedHeight: 180,
            floating: false,
            pinned: true,
            elevation: 0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: Text(
                'Halo, ${'Vinsensius Arko'}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(
                        Icons.warehouse,
                        size: 200,
                        color: Colors.white.withValues(alpha: 0.1)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Visibility(
                visible: kDebugMode,
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.NOTIFICATION);
                    /// Opsional: Reset notif pas diklik
                    controller.hasNotification = !controller.hasNotification;
                  },
                  icon: Stack(
                    children: [
                      const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 28,
                      ),
                      Builder(
                        builder: (context) {
                          if (controller.hasNotification) {
                            return Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  // border: Border.all(color: Colors.blue.shade500, width: 1.5),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 10,
                                  minHeight: 10,
                                ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(controller.animController),
                child: IconButton(
                  onPressed: controller.isLoading.value ? null : () => controller.refreshData(),
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ringkasan Inventaris',
                    style: TextStyle(
                      fontSize: Dimensions.font15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    )
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      _buildStatCard(
                        title: 'Total Stok Barang',
                        value: 12.toString(),
                        icon: Icons.inventory_2,
                        color: Colors.orange
                      ),
                      SizedBox(width: Dimensions.width10),
                      _buildStatCard(
                        title: 'Gudang',
                        value: 5.toString(),
                        icon: Icons.storefront,
                        color: Colors.blue
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  _buildStatCard(
                    title: 'Transfer Proses',
                    value: 25.toString(),
                    icon: Icons.local_shipping,
                    color: Colors.green,
                    isFullWidth: true
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Untuk Mengakses menu, silakan klik menu yang tersedia pada navigasi bawah.',
                style: TextStyle(
                  fontSize: Dimensions.font14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20 - 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius12),
              ),
              child: InkWell(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10
                        ),
                        child: AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Menu Kasir',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          content: Text(
                            'Apakah anda yakin ingin masuk ke menu kasir?',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.font12,
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Get.back(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                'Batal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font12,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => Get.offAllNamed(Routes.MAIN),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shadowColor: Colors.transparent,
                                elevation: 0
                              ),
                              child: Text(
                                'Iya',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  );
                },
                borderRadius: BorderRadius.circular(Dimensions.radius12),
                child: Container(
                  padding: EdgeInsets.all(Dimensions.radius12 + 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple.withValues(alpha: 0.1),
                            child: Icon(Icons.point_of_sale, color: Colors.deepPurple, size: 20),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Text(
                            'Menu Kasir',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: Colors.deepPurple, size: 16),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10),
                      Text(
                        'Jika anda ingin masuk ke menu kasir silahkan tap disini',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: Dimensions.font12
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: Dimensions.height20)),
          /// --- Section Baru: Laporan Harian ---
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Laporan Hari Ini',
                    style: TextStyle(
                      fontSize: Dimensions.font15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    )
                  ),
                  SizedBox(height: Dimensions.height10),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight + Dimensions.height45)),
        ],
      ),
    );
  }

  /// Helper Widget: Stat Card
  Widget _buildStatCard({required String title, required String value, required IconData icon, required Color color, bool isFullWidth = false, Widget child = const SizedBox.shrink()}) {
    Widget card = Container(
      width: isFullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(
              icon,
              color: color,
              size: 20
            ),
          ),
          SizedBox(height: Dimensions.height10),
          if (value != '')...[
            Text(
              value,
              style: TextStyle(
                fontSize: Dimensions.font14 + 1,
                fontWeight: FontWeight.bold
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ] else...[
            child
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: Dimensions.font12 - 0.5,
            )
          ),
        ],
      ),
    );
    return isFullWidth ? card : Expanded(child: card);
  }
}
