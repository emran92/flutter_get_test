import 'package:flutter_get_test/view/home_view.dart';
import 'package:flutter_get_test/view/login_view.dart';
import 'package:get/get.dart';

class Routes{
  
  static final route = [
    GetPage(name: '/login', page: () => LoginView()),
    GetPage(name: '/home', page: () => HomeView()),
  ];
  
  
}