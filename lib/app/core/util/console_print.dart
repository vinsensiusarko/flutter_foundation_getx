/*
 * Created by Vinsensius Arko on 10/12/2024, 17:15
 * vinsensiusarka@gmail.com
 * Last modified 10/12/2024, 17:15
 * Copyright (c) 2024.
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



