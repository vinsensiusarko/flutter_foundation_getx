/*
 * Created by Vinsensius Arko on 14/07/2025, 15:43
 * vinsensiusarka@gmail.com
 * Last modified 14/07/2025, 15:43
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/core/helper/shared_pref.dart';

class SplashRepository {
  bool? showOnboarding() {
    return SharedPreferencesManager.getBool('intro') ?? false;
  }

  Future<bool> setIntro(bool intro) {
    return SharedPreferencesManager.setBool('intro', intro);
  }

  bool getTheme() {
    return SharedPreferencesManager.getBool('isDarkTheme') ?? false;
  }
}
