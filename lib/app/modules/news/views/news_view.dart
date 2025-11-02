import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/app_config.dart';
import '../../../core/util/dimensions.dart';
import '../../../data/constant/images_constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News'),
            forceMaterialTransparency: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              return Future.delayed(const Duration(seconds: 2));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterLogo(size: Dimensions.radius15),
                    SizedBox(width: Dimensions.width10 - 5),
                    Text(
                      'News List',
                      style: TextStyle(
                        fontSize: Dimensions.font14,
                        fontWeight: FontWeight.w400,
                        color: appController.appTheme.textColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    key: controller.homeScreenList,
                    children: [
                      ...List.generate(20, (index) {
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
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
