import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/src/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      theme: ThemeData(),
    );
  }
}
