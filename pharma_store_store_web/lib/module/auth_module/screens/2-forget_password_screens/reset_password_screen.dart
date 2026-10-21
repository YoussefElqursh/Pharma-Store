import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:password_strength_indicator/password_strength_indicator.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/input_field_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class ResetPasswordScreen extends StatefulWidget {

  static const String routeName = 'ResetPasswordScreenRoute';

  const ResetPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ResetPasswordScreen(),
    );
  }


  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String password = '';

  final newPasswordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: LeftSideWidget(),
          ),
          Expanded(
            child: RightSideWidget(
              height: 518,
              child: rightSide(context),
            ),
          ),
        ],
      ),
    );
  }

  rightSide(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reset password',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Your new password must be different to previously used passwords.',
            style: TextStyle(
              color: Color(0xFF60656E),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 33.0),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'New Password',
                  style: TextStyle(
                    color: Color(0xFF23262A),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFDC2626),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          inputFieldWidget(
            controller: newPasswordController,
            hintText: 'Enter new password',
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            validator: (value){
              if(newPasswordController.text.isEmpty){
                return 'Password is empty';
              }
              return null;
            }
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: PasswordStrengthIndicator(
              width: 70,
              thickness: 3,
              backgroundColor: HexColor(bWhite90),
              radius: 8,
              colors: StrengthColors(
                weak: HexColor(error),
                medium: HexColor(warning),
                strong: HexColor(success),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              callback: (double strength) {
                if (kDebugMode) {
                  print('Password Strength: $strength');
                }
              },
              strengthBuilder: (String password) {
                return password.length / 10;
              },
              style: StrengthBarStyle.dashed,
              password: password,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Confirm Password',
                  style: TextStyle(
                    color: Color(0xFF23262A),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFDC2626),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          inputFieldWidget(
            controller: confirmedPasswordController,
            hintText: 'Enter confirm password',
            validator: (value){
              if(confirmedPasswordController.text.isEmpty){
                return 'confirm password is empty';
              }
              else if(confirmedPasswordController.text != password){
                return 'two passwords not matched';
              }
              return null;
            }
          ),
          const SizedBox(height: 33.0),
          buttonWidget(
            kind: 2,
            text: 'Reset',
            onPressed: (){
              if (formkey.currentState!.validate()) {
                navigateTo(
                    context, 'ChangedPasswordScreenRoute');
              }
            },
          ),
          const SizedBox(height: 17),
          Center(
            child: GestureDetector(
              onTap: () {
                navigateTo(context, 'LoginScreenRoute');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: HexColor(primary),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Back to login page',
                    style: TextStyle(
                      color: HexColor(primary),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
