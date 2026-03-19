/*
 * Created by Vinsensius Arko on 19/07/2025, 00:49
 * vinsensiusarka@gmail.com
 * Last modified 19/07/2025, 00:49
 * Copyright (c) 2025.
 * All rights reserved.
 */

import '../../../core/helper/shared_pref.dart';

class AuthRepository {
  final SharedPreferencesManager sharedPreferencesManager;

  AuthRepository({required this.sharedPreferencesManager});

  bool? getAuthentication() {
    return sharedPreferencesManager.getBool('authentication');
  }

  Future<bool> setAuthentication(bool authentication) {
    return sharedPreferencesManager.putBool('authentication', authentication);
  }
}
