import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// import 'package:the_green_whale/authentication/auth.dart';

import 'package:the_green_whale/authentication/login_page.dart';
import 'package:the_green_whale/services/database_service.dart';
import 'package:the_green_whale/utils/colors.dart';

import '../utils/text_styles.dart';
import 'auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String id = "/signup";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String countryCode = "+1";
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

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
            mainAxisSize: MainAxisSize.min,
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
                      Navigator.of(context).pushReplacementNamed(LoginPage.id);
                    },
                    child: Text(
                      "Login",
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
                "Mobile Number",
                style: subtitleTextStyle.copyWith(fontSize: 60.sp),
              ),
              SizedBox(
                height: 25.sp,
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
                        dialogSize: Size(size.height * 0.5, size.height * 0.7),
                        initialSelection: "+1",
                        dialogBackgroundColor: primaryColor,
                        showFlag: false,
                        barrierColor: primaryColor,
                        textStyle: titleTextStyle.copyWith(
                          color: Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge!.fontSize,
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
              SizedBox(height: 30.sp),
              Text(
                "Name",
                style: subtitleTextStyle.copyWith(
                  fontSize: 60.sp,
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Form(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _name,
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
                "Email Address",
                style: subtitleTextStyle.copyWith(
                  fontSize: 60.sp,
                ),
              ),
              SizedBox(
                height: 30.sp,
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
                height: 30.sp,
              ),
              Form(
                child: TextFormField(
                  controller: _password,
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
                "Confirm Password",
                style: subtitleTextStyle.copyWith(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Form(
                child: TextFormField(
                  controller: _passwordConfirm,
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
              const Spacer(),
              // SizedBox(
              //   height: 150.sp,
              // ),
              GestureDetector(
                onTap: () async {
                  try {
                    dynamic uid =
                        context.read<Auth>().firebaseAuth.currentUser?.uid;
                    print("UID");
                    print(uid);

                    await context
                        .read<Auth>()
                        .createUser(_email.text.trim(), _password.text.trim());
                    await DatabaseService(uid: uid).addUser(
                      _name.text.trim(),
                      _email.text,
                      countryCode + _mobileNumber.text,
                    );
                    print(
                      DatabaseService.firebaseFirestore
                          .collection("users")
                          .doc(uid)
                          .get(),
                    );

                    Navigator.of(context).pushNamed(LoginPage.id);
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.message.toString(),
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                      ),
                    );
                  }
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 160.sp,
                    width: size.width,
                    child: Text(
                      "Signup",
                      style: titleTextStyle.copyWith(fontSize: 60.sp),
                    ),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCountryChange(CountryCode country) {
    countryCode = country.toString();
  }
}
