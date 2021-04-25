import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_test/model/user.dart';
import 'package:flutter_get_test/service/request.dart';
import 'package:flutter_get_test/service/url.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _apiGetUser();
    super.onInit();
  }

  void _apiGetUser() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(
            Center(
              child: CircularProgressIndicator(),
            ),
            barrierDismissible: false));

    Request request = Request(url: userUrl, body: null);
    request.get().then((value) {
      UserListModel userListModel =
          UserListModel.fromJson(json.decode(value.body));
      userList.value = userListModel.data;
      Get.back();
    }).catchError((e) => print(e));
  }

  void deleteUser(int index){
    userList.removeAt(index);
  }
}
