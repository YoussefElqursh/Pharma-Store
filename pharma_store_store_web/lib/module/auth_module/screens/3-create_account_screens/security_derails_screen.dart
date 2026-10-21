import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/bloc/create_account_bloc/create_account_cubit.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/account_created_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/basic_details_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/lincense_and_verification_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/3-create_account_screens/location_details_screen.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/input_field_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class SecurityDerailsScreen extends StatefulWidget {

  static const String routeName = 'SecurityDerailsScreenRoute';

  const SecurityDerailsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SecurityDerailsScreen(),
    );
  }

  @override
  State<SecurityDerailsScreen> createState() => _SecurityDerailsScreenState();
}

class _SecurityDerailsScreenState extends State<SecurityDerailsScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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
              height: 551,
              child: rightSide(context),
            ),
          ),
        ],
      ),
    );
  }

  bool? isChecked = false;

  rightSide(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        if( state is CreateAccountSuccessState){
          navigateToWithoutBack(context, const AccountCreatedScreen());
        }
        else if( state is CreateAccountErrorState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: SizedBox(
                child: Text(
                  'something went wrong, try again later',
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
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
              const SizedBox(height: 8),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Step 4 of 4: ',
                      style: TextStyle(
                        color: Color(0xFF60656E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Security Details ',
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
                      text: 'Username',
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
                controller: usernameController,
                hintText: 'Enter username',
                validator: (value) {
                  if (usernameController.text.isEmpty) {
                    return 'Username is empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Password',
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
                controller: passwordController,
                hintText: 'Enter password',
                suffixIcon: const Icon(
                  Icons.visibility_outlined,
                  color: Color(0xFFABADAE),
                ),
                validator: (input) {
                  if (passwordController.text.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    tristate: false,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    activeColor: HexColor(primary),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By creating account, you agree to our ',
                          style: TextStyle(
                            color: Color(0xFF23262A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of\nService',
                          style: TextStyle(
                            color: Color(0xFF4A71FF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' and our ',
                          style: TextStyle(
                            color: Color(0xFF23262A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF4A71FF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            color: Color(0xFF23262A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  buttonWidget(
                    kind: 1,
                    text: 'Previous',
                    color: white,
                    width: 130,
                    onPressed: () {
                      navigateTo(context, 'LicenseAndVerificationScreenRoute');
                    },
                  ),
                  const Spacer(),
                  buttonWidget(
                    kind: 2,
                    text: 'Create',
                    color: primary,
                    width: 200,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<CreateAccountCubit>(context).userRegister(
                            storeName: BasicDetailsScreen.storeNameController.text,
                            country: LocationDetailsScreenState.countriesSelectedValue.toString(),
                            governorate: LocationDetailsScreenState.governmentsSelectedValue.toString(),
                            region: LocationDetailsScreenState.regionsSelectedValue.toString(),
                            address: LocationDetailsScreenState.addressController.text,
                            contactNumber: BasicDetailsScreen.phoneNumberController.text,
                            email: BasicDetailsScreen.emailController.text,
                            taxLicense: LicenseAndVerificationScreenState.taxLicensePickedFile!,
                            taxCard: LicenseAndVerificationScreenState.taxLicensePickedFile!,
                            commercialRegister: LicenseAndVerificationScreenState.commercialRegisterPickedFile!,
                            userName: usernameController.text,
                            password: passwordController.text,
                            isActive: isChecked.toString(),
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
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
                    onPressed: () {
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
      },
    );
  }
}
