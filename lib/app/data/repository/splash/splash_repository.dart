/*
 * Created by Vinsensius Arko on 14/07/2025, 15:43
 * vinsensiusarka@gmail.com
 * Last modified 14/07/2025, 15:43
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/core/helper/shared_pref.dart';

class SplashRepository {
  final SharedPreferencesManager sharedPreferencesManager;

  SplashRepository({required this.sharedPreferencesManager});

  bool? showOnboarding() {
    return sharedPreferencesManager.getBool('intro');
  }

  Future<bool> setIntro(bool intro) {
    return sharedPreferencesManager.putBool('intro', intro);
  }

  bool getTheme() {
    return sharedPreferencesManager.getBool('isDarkTheme');
  }
}
