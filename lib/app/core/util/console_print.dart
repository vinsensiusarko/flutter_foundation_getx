/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 11/12/2024, 00:31
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

void jsonPrint(Object? object) {
  logger.d(object);
}

void objectPrint(Object? object) {
  logger.i(object);
}



