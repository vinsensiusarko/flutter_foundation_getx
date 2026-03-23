/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 19/03/2026, 16:14
 * Copyright (c) 2026.
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
