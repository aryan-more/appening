import 'package:appening/screen/userinfo/userinfo.dart';
import 'package:appening/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Appening",
      theme: AppTheme.themeData(lightTheme),
      darkTheme: AppTheme.themeData(darkTheme),
      home: UserInfoScreen(),
    ),
  );
}
