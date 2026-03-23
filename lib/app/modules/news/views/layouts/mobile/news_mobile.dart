/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 24/03/2026, 00:04
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/modules/news/controllers/news_controller.dart';
import 'package:get/get.dart';

import '../../../../../core/util/app_config.dart';
import '../../../../../core/util/dimensions.dart';
import '../../../../../data/constant/images_constant.dart';
import '../../../../../routes/app_pages.dart';

class NewsMobile extends StatelessWidget {
  final NewsController controller;
  const NewsMobile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      start: 16 + (0 * t),
                      bottom: 16,
                    ),
                    centerTitle: false,
                    title: Text(
                      'Product',
                      style: TextStyle(
                        color: Color.lerp(Colors.black, Colors.white, t),
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font20,
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
                        'Sort Product',
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
                (context, index) {
                final item = index + 1;
                return GestureDetector(
                  onTap: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Get.toNamed(Routes.DETAIL, arguments: {
                        'id': item,
                        'title': 'Item $item',
                        'body': 'Body $item',
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.radius12 - 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Dimensions.loginImg - 40,
                          width: Dimensions.loginImg - 40,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius12),
                          ),
                          child: Image.asset(
                            Images.heheBoi,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: Dimensions.width10 - 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Judul Makanan $item',
                                style: TextStyle(
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w500,
                                  color: appController.appTheme.textColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(width: Dimensions.width10 - 8),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: Dimensions.font12,
                                      fontWeight: FontWeight.w400,
                                      color: appController.appTheme.textColor,
                                    )
                                  ),
                                  SizedBox(width: Dimensions.width10 - 8),
                                  Text(
                                    '(1K+)',
                                    style: TextStyle(
                                      fontSize: Dimensions.font12,
                                      fontWeight: FontWeight.w400,
                                      color: appController.appTheme.textColor,
                                    )
                                  ),
                                  SizedBox(width: Dimensions.width10 - 8),
                                  Text(
                                    '\$\$\$\$',
                                    style: TextStyle(
                                      fontSize: Dimensions.font12,
                                      fontWeight: FontWeight.w400,
                                      color: appController.appTheme.textColor,
                                    )
                                  ),
                                  SizedBox(width: Dimensions.width10 - 8),
                                  Text(
                                      'Breakfast',
                                      style: TextStyle(
                                        fontSize: Dimensions.font12,
                                        fontWeight: FontWeight.w400,
                                        color: appController.appTheme.textColor,
                                      )
                                  )
                                ],
                              ),
                              Text(
                                'Rp10.000',
                                style: TextStyle(
                                  fontSize: Dimensions.font12,
                                  fontWeight: FontWeight.w400,
                                  color: appController.appTheme.textColor,
                                ),
                              ),
                              Text(
                                'Deskripsi Makanan yang sangat enak sekali $item',
                                style: TextStyle(
                                  fontSize: Dimensions.font12,
                                  fontWeight: FontWeight.w400,
                                  color: appController.appTheme.textColor,
                                ),
                              ),
                              Obx(() {
                                int itemCount = controller.showAllItems.value ? controller.itemDiscount.length : 1;
                                return SizedBox(
                                  height: Dimensions.height20,
                                  child: ListView.builder(
                                    key: controller.discountList,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: itemCount + (controller.itemDiscount.length > 1 && !controller.showAllItems.value ? 1 : 0),
                                    itemBuilder: (context, index) {
                                      /// Kondisi untuk menampilkan tombol 'More'
                                      if (index == itemCount && !controller.showAllItems.value) {
                                        return Container(
                                          margin: EdgeInsets.only(right: Dimensions.width10 - 5),
                                          child: InkWell(
                                            onTap: () {
                                              controller.showMoreDiscount();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 -5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius10 - 6),
                                                border: Border.all(
                                                  color: appController.appTheme.textColor.withValues(alpha: 0.4),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'More +',
                                                  style: TextStyle(
                                                    fontSize: Dimensions.font12 - 2,
                                                    fontWeight: FontWeight.w400,
                                                    color: appController.appTheme.textColor,
                                                  ),
                                                )
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return Container(
                                        margin: EdgeInsets.only(right: Dimensions.width10 -5),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 -5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius10 - 6),
                                              border: Border.all(
                                                color: appController.appTheme.textColor.withValues(alpha: 0.4),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Hehe $index',
                                                style: TextStyle(
                                                  fontSize: Dimensions.font12 - 2,
                                                  fontWeight: FontWeight.w400,
                                                  color: appController.appTheme.textColor,
                                                ),
                                              )
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  ),
                                );
                              })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            )
          ),
          SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight + Dimensions.height45)),
        ],
      ),
    );
  }
}

