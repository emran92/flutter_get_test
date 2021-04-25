import 'package:flutter/material.dart';
import 'package:flutter_get_test/controller/home_controller.dart';
import 'package:flutter_get_test/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Users',style: GoogleFonts.exo2(),),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              'Logged in ${_loginController.emailTextController.text}',
              style: GoogleFonts.exo2(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: _homeController.userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_homeController.userList[index].firstName,style: GoogleFonts.exo2(fontWeight: FontWeight.w500),),
                      subtitle: Text(_homeController.userList[index].email,style: GoogleFonts.exo2(fontWeight: FontWeight.normal),),
                      leading: CircleAvatar(
                        radius: 30,
                        foregroundImage: NetworkImage('${_homeController.userList[index].avatar}'),
                        child: Container(
                        )
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _homeController.deleteUser(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
