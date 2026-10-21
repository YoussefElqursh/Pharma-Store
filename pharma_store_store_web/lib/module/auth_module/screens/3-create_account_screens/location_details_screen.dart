import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/input_field_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class LocationDetailsScreen extends StatefulWidget {

  static const String routeName = 'LocationDetailsScreenRoute';

  const LocationDetailsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LocationDetailsScreen(),
    );
  }

  @override
  State<LocationDetailsScreen> createState() => LocationDetailsScreenState();
}

class LocationDetailsScreenState extends State<LocationDetailsScreen> {

  final formkey = GlobalKey<FormState>();

  static final addressController = TextEditingController();

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
              height: 680,
              child: rightSide(context),
            ),
          ),
        ],
      ),
    );
  }

  static String? countriesSelectedValue;
  static String? governmentsSelectedValue;
  static String? regionsSelectedValue;

  List<String> countries = [
    'canada',
    'usa',
    'Egypt',
  ];

  List<String> governments = [
    'Alex',
    'californium',
    'tanta',
  ];

  List<String> regions = [
    'asfra',
    'aboquir',
    'sidigaber',
  ];

  rightSide(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
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
                    text: 'Step 2 of 4: ',
                    style: TextStyle(
                      color: Color(0xFF60656E),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'Location Details ',
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
            const SizedBox(height: 30),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Country',
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
            DropdownButtonFormField2(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDE1EB),
                      width: 1.5,
                    ),
                ),
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFDC2626),
                    width: 1.5,
                  ),
                ),
              ),
              isExpanded: true,
              value: countriesSelectedValue,
              hint: Text(
                'select your country',
                style: TextStyle(
                  color: HexColor(white70),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              onChanged: (value) {
                setState(() {
                  countriesSelectedValue = value;
                });
              },
              items: countries
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFFDDE1EB),
                ),
              ),
              validator: (value){
                if (value == null) {
                  return 'Please select country.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Government',
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
            DropdownButtonFormField2(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFDDE1EB),
                    width: 1.5,
                  ),
                ),
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFDC2626),
                    width: 1.5,
                  ),
                ),
              ),
              isExpanded: true,
              value: governmentsSelectedValue,
              hint: Text(
                'select your Government',
                style: TextStyle(
                  color: HexColor(white70),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              onChanged: (value) {
                setState(() {
                  governmentsSelectedValue = value;
                });
              },
              items: governments
                  .map(
                    (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
                  .toList(),
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                color: Color(0xFFDDE1EB),
              ),
              ),
              validator: (value){
                if (value == null) {
                  return 'Please select Government.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Region',
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
            DropdownButtonFormField2(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFDDE1EB),
                    width: 1.5,
                  ),
                ),
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFDC2626),
                    width: 1.5,
                  ),
                ),
              ),
              isExpanded: true,
              value: regionsSelectedValue,
              hint: Text(
                'select your region',
                style: TextStyle(
                  color: HexColor(white70),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              onChanged: (value) {
                setState(() {
                  regionsSelectedValue = value;
                });
              },
              items: regions
                  .map(
                    (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
                  .toList(),
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFFDDE1EB),
                ),
              ),
              validator: (value){
                if (value == null) {
                  return 'Please select region.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Address',
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
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            inputFieldWidget(
              controller: addressController,
              hintText: 'Enter address',
              validator: (value){
                if(addressController.text.isEmpty){
                  return 'Address is empty';
                }
                return null;
              }
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                buttonWidget(
                  kind: 1,
                  text: 'Previous',
                  color: white,
                  width: 130,
                  onPressed: (){
                    navigateTo(context, 'BasicDetailsScreenRoute');
                  },
                ),
                const Spacer(),
                buttonWidget(
                  kind: 0,
                  text: 'Next',
                  color: primary,
                  width: 200,
                  onPressed: (){
                    if (formkey.currentState!.validate()) {
                      navigateTo(context, 'LicenseAndVerificationScreenRoute');
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
      ),
    );
  }
}
