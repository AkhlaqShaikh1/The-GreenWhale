import 'package:flutter/material.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.02,
            vertical: size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Sign in to",
                    style: titleTextStyle.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.headline4!.fontSize),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Sign Up",
                      style: titleTextStyle.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize),
                    ),
                  ),
                ],
              ),
              Text(
                "your account",
                style: titleTextStyle.copyWith(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Text(
                " Email Address",
                style: subtitleTextStyle.copyWith(
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Form(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
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
                height: size.height * 0.03,
              ),
              Text(
                "Password",
                style: subtitleTextStyle.copyWith(
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize),
              ),
              SizedBox(
                height: size.height * 0.015,
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
                height: size.height * 0.015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "Forgot Password?",
                    style: titleTextStyle.copyWith(
                      fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: size.width,
                  child: Text(
                    "Login",
                    style: titleTextStyle.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize),
                  ),
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
