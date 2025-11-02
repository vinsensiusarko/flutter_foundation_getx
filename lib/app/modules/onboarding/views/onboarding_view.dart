import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../style/color.dart';
import '../../../core/util/dimensions.dart';
import '../../../data/constant/images_constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) {
        return Material(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              image: const DecorationImage(
                image: AssetImage(Images.applicationLogo),
              ),
            ),
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (value) {
                    controller.setPageIndex(value);
                  },
                  controller: controller.pageController,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /*Center(
                          child: Image.asset(
                            Images.applicationLogo,
                            height: Dimensions.loginImg,
                          ),
                        ),*/
                        Center(
                          child: FlutterLogo(
                            curve: Curves.bounceInOut,
                            size: Dimensions.loginImg,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Onboarding 1',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Text(
                            'Anda dapat mengatur bla bla bla menjadi wehehe 1.',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.colorBlack,
                              fontSize: Dimensions.font12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: FlutterLogo(
                            curve: Curves.bounceInOut,
                            size: Dimensions.loginImg,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Onboarding 2 ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Text(
                            'Anda dapat mengatur bla bla bla menjadi wehehe 2.',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.colorBlack,
                              fontSize: Dimensions.font12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: FlutterLogo(
                            curve: Curves.bounceInOut,
                            size: Dimensions.loginImg,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Onboarding 3',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Text(
                            'Anda dapat mengatur bla bla bla menjadi wehehe 3.',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.colorBlack,
                              fontSize: Dimensions.font12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.colorBlack,
                                  width: 2,
                                ),
                                color: controller.pageIndex == 0
                                    ? AppColors.mainColor
                                    : AppColors.colorWhite,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.colorBlack,
                                ),
                                color: controller.pageIndex == 1
                                    ? AppColors.mainColor
                                    : AppColors.colorWhite,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.colorBlack,
                                  width: 2,
                                ),
                                color: controller.pageIndex == 2
                                    ? AppColors.mainColor
                                    : AppColors.colorWhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Opacity(
                              opacity: controller.pageIndex != 2 ? 1.0 : 0.0,
                              child: TextButton(
                                child: const Text(
                                  'SKIP',
                                  style: TextStyle(
                                    color: AppColors.colorBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  Get.offNamed(Routes.MAIN);
                                },
                              ),
                            ),
                            if (controller.pageIndex != 2) ...[
                              TextButton(
                                child: const Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: AppColors.colorBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  if (!(controller.pageController.page == 2)) {
                                    controller.pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.linear,
                                    );
                                  }
                                },
                              ),
                            ] else ...[
                              TextButton(
                                child: const Text(
                                  'FINISH',
                                  style: TextStyle(
                                    color: AppColors.colorBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  Get.offNamed(
                                    Routes.LOGIN,
                                    arguments: {
                                      controller.splashRepository.setIntro(
                                        true,
                                      ),
                                    },
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
