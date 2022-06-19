import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:the_green_whale/authentication/auth.dart';
import 'package:the_green_whale/authentication/signup_page.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  static String id = "/login";

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 55.sp,
            vertical: 65.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Sign in to",
                    style: titleTextStyle.copyWith(fontSize: 80.sp),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(SignUpPage.id);
                    },
                    child: Text(
                      "Sign Up",
                      style: titleTextStyle.copyWith(fontSize: 55.sp),
                    ),
                  ),
                ],
              ),
              Text(
                "your account",
                style: titleTextStyle.copyWith(
                  fontSize: 80.sp,
                ),
              ),
              SizedBox(
                height: 100.sp,
              ),
              Text(
                "Email Address",
                style: subtitleTextStyle.copyWith(fontSize: 60.sp),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Form(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  cursorColor: greenColor,
                  cursorHeight: 60.sp,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greenColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60.sp,
              ),
              Text(
                "Password",
                style: subtitleTextStyle.copyWith(fontSize: 60.sp),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Form(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _password,
                  cursorColor: greenColor,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greenColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35.sp,
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "Forgot Password?",
                    style: titleTextStyle.copyWith(
                      fontSize: 60.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      try {
                        // await Auth()
                        //     .signIn(_email.text.trim(), _password.text.trim());
                        context
                            .read<Auth>()
                            .signIn(_email.text.trim(), _password.text.trim());

                        Navigator.of(context).pushNamed('/home');
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message.toString()),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 160.h,
                      width: size.width,
                      child: Text(
                        "Login",
                        style: titleTextStyle.copyWith(fontSize: 60.sp),
                      ),
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
