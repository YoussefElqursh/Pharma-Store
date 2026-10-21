import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/input_field_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class BasicDetailsScreen extends StatelessWidget {

  static const String routeName = 'BasicDetailsScreenRoute';

  final formkey = GlobalKey<FormState>();
  static final storeNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneNumberController = TextEditingController();

  BasicDetailsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BasicDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: LeftSideWidget(),
          ),
          Expanded(
            child: RightSideWidget(
              height: 588,
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
            const Text(
              'Create Account',
              style: TextStyle(
                color: Color(0xFF23262A),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Step 1 of 4: ',
                    style: TextStyle(
                      color: Color(0xFF60656E),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'Basic Details ',
                    style: TextStyle(
                      color: Color(0xFF23262A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Store Name',
                    style: TextStyle(
                      color: Color(0xFF23262A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Color(0xFFDC2626),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            inputFieldWidget(
              controller: storeNameController,
              hintText: 'Enter store name',
              validator: (value){
                if(storeNameController.text.isEmpty){
                  return 'Store name is empty';
                }
                return null;
              }
            ),
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Email',
                    style: TextStyle(
                      color: Color(0xFF23262A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Color(0xFFDC2626),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            inputFieldWidget(
              controller: emailController,
              hintText:  'Enter email',
              validator: (value){
                if(emailController.text.isEmpty){
                  return 'Email is empty';
                }
                return null;
              }
            ),
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Phone Number',
                    style: TextStyle(
                      color: Color(0xFF23262A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Color(0xFFDC2626),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Color(0xFF23262A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor(bWhite90),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '+20',
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(
                            maxWidth: 380, maxHeight: 48),
                        hintText: 'Enter phone number',
                        hintStyle: TextStyle(
                          color: Color(0xFFB1B9C5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color(0xFFDDE1EB),
                              strokeAlign: BorderSide.strokeAlignCenter,
                              width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color(0xFFDDE1EB),
                              strokeAlign: BorderSide.strokeAlignCenter,
                              width: 0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color(0xFFDDE1EB),
                              strokeAlign: BorderSide.strokeAlignCenter,
                              width: 0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color(0xFFDDE1EB),
                              strokeAlign: BorderSide.strokeAlignCenter,
                              width: 0),
                        ),
                      ),
                      validator: (value){
                        if(phoneNumberController.text.isEmpty){
                          return 'Phone Number is empty';
                        }else if(phoneNumberController.text.length != 11){
                          return 'Phone Number is wrong';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            buttonWidget(
              kind: 0,
              text: "Next",
              onPressed: (){
                if (formkey.currentState!.validate()) {
                 navigateTo(context, 'LocationDetailsScreenRoute') ;
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Color(0xFF23262A),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: (){
                    navigateTo(context, 'LoginScreenRoute');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF4A71FF),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
      ),
    );
  }
}
