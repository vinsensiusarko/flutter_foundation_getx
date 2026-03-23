/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 19/03/2026, 16:14
 * Copyright (c) 2026.
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
