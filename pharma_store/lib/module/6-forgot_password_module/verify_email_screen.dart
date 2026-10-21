import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pharma_store/module/6-forgot_password_module/reset_via_sms_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import 'new_password_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  static const String routeName = 'VerifyEmailScreenRoute';
  const VerifyEmailScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const VerifyEmailScreen(),
    );
  }

  @override
  State<VerifyEmailScreen> createState() => _ResetViaSmsScreenState();
}

class _ResetViaSmsScreenState extends State<VerifyEmailScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height / 10.447),
        child: Padding(
          padding: const EdgeInsets.only(top: 58, left: 19),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            InkWell(
              onTap: () {
                navigateTo(context, ResetViaSmsScreen.routeName);
              },
              child: setPhoto(
                  kind: 1,
                  path: 'assets/icons/arrow-left.svg',
                  height: 24,
                  width: 24),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify email ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor(dark)),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 171.34),
                Text(
                  "We’ve sent a verification code to ma***@gmail.com. Please check your email  and enter the code.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: HexColor(dark)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  autoFocus: true,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    borderWidth: 1,
                    activeColor: HexColor(primaryColor),
                    inactiveColor: HexColor(placeholder),
                    inactiveFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    selectedColor:HexColor(primaryColor),
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (code) {
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Didn’t receive the code? ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          color: HexColor(dark))),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: HexColor(primaryColor)),
                      ))
                ]),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                commonMaterialBtn(
                    label: 'Verify',
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        navigateTo(context, NewPasswordScreen.routeName);

                      }
                    },
                    width: double.infinity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
