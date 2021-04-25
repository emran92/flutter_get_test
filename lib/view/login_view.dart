import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_test/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Login',style: GoogleFonts.exo2(),),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _loginController.emailTextController,
                decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.grey[200],
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0))),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) {
                  return value.trim().isEmpty ? 'Email required' : null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _loginController.passwordTextController,
                decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Colors.grey[200],
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ))),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) {
                  return value.trim().isEmpty ? 'Password required' : null;
                },
              ),
              SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _loginController.apiLogin();
                  }
                },
                color: CupertinoColors.activeBlue,
                splashColor: Colors.white,
                height: 40,
                minWidth: Get.width / 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.exo2(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
