import 'package:flutter/material.dart';
import 'package:flutter_get_test/utils/router.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.route,
      initialRoute: '/login',
    );
  }
}
