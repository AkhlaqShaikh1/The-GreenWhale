import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:the_green_whale/authentication/login_page.dart';
import 'package:the_green_whale/utils/colors.dart';

import '../utils/text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String id = "/signup";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String countryCode;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.02,
            vertical: size.height * 0.03,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.id);
                      },
                      child: Text(
                        "Login",
                        style: titleTextStyle.copyWith(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline6!
                                .fontSize),
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
                  height: size.height * 0.04,
                ),
                Text(
                  "Mobile Number",
                  style: subtitleTextStyle.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.headline6!.fontSize),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Form(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: subtitleColor),
                        ),
                        child: CountryCodePicker(
                          backgroundColor: primaryColor,
                          onChanged: _onCountryChange,
                          dialogSize:
                              Size(size.height * 0.5, size.height * 0.7),
                          initialSelection: "+1",
                          dialogBackgroundColor: primaryColor,
                          showFlag: false,
                          barrierColor: primaryColor,
                          textStyle: titleTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      SizedBox(
                        width: size.width * 0.6,
                        child: TextField(
                          controller: _mobileNumber,
                          cursorColor: greenColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greenColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Email Address",
                  style: subtitleTextStyle.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.headline6!.fontSize),
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
                      fontSize:
                          Theme.of(context).textTheme.headline6!.fontSize),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Form(
                  child: TextFormField(
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
                  height: size.height * 0.03,
                ),
                Text(
                  "Confirm Password",
                  style: subtitleTextStyle.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.headline6!.fontSize),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Form(
                  child: TextFormField(
                    controller: _passwordConfirm,
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
                  height: size.height * 0.11,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.075,
                    width: size.width,
                    child: Text(
                      "Signup",
                      style: titleTextStyle.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.titleLarge!.fontSize),
                    ),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCountryChange(CountryCode country) {
    countryCode = country.toString();
  }
}
