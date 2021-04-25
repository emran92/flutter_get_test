import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_test/service/request.dart';
import 'package:flutter_get_test/service/url.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    // TODO: implement onInit

    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);

    Request request = Request(url: loginUrl, body: {
      'email': emailTextController.text,
      'password': passwordTextController.text
    });

    request.post().then((value) {
      Get.back();
      Get.toNamed('/home');

    }).catchError((e)=> print(e));

  }
}
