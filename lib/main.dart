import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'src/app_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const AppWidget());
}
