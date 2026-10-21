import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class LicenseAndVerificationScreen extends StatefulWidget {

  static const String routeName = 'LicenseAndVerificationScreenRoute';

  const LicenseAndVerificationScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LicenseAndVerificationScreen(),
    );
  }

  @override
  State<LicenseAndVerificationScreen> createState() => LicenseAndVerificationScreenState();
}

class LicenseAndVerificationScreenState extends State<LicenseAndVerificationScreen> {

  bool isEmpty = true;
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
              height: 588,
              child: rightSide(context),
            ),
          ),
        ],
      ),
    );
  }

  rightSide(BuildContext context) {
    return Column(
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
                text: 'Step 3 of 4: ',
                style: TextStyle(
                  color: Color(0xFF60656E),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'License & Verification',
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
        const SizedBox(height: 37),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Tax License',
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
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: isEmpty ? Border.all(
                color: const Color(0xFFDDE1EB),
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 1.5,
              ):  Border.all(
                color: const Color(0xFFDC2626),
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 1.5,
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                taxLicensePickedFile != null
                    ? Text( taxLicenseFileName!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : const Text(
                        'Upload tax license',
                        style: TextStyle(
                          color: Color(0xFFB1B9C5),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                const Spacer(),
                Container(
                  width: 91,
                  height: 34,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x0C4A71FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: MaterialButton(
                    height: 34,
                    minWidth: 91,
                    onPressed: (){taxLicensePickFile();},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_outlined, color: Color(0xFF4A71FF) ,),
                        SizedBox(width: 6),
                        Text(
                          'Upload',
                          style: TextStyle(
                            color: Color(0xFF4A71FF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Tax Card ',
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
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: isEmpty ? Border.all(
              color: const Color(0xFFDDE1EB),
              strokeAlign: BorderSide.strokeAlignCenter,
              width: 1.5,
            ):  Border.all(
              color: const Color(0xFFDC2626),
              strokeAlign: BorderSide.strokeAlignCenter,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                taxCardPickedFile != null
                    ? Text(
                  taxCardFileName!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                )
                    : const Text(
                  'Upload tax card',
                  style: TextStyle(
                    color: Color(0xFFB1B9C5),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 91,
                  height: 34,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x0C4A71FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: MaterialButton(
                    height: 34,
                    minWidth: 91,
                    onPressed: (){taxCardPickFile();},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_outlined, color: Color(0xFF4A71FF) ,),
                        SizedBox(width: 6),
                        Text(
                          'Upload',
                          style: TextStyle(
                            color: Color(0xFF4A71FF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Commercial Register',
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
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border:isEmpty ? Border.all(
                color: const Color(0xFFDDE1EB),
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 1.5,
              ):  Border.all(
                color: const Color(0xFFDC2626),
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 1.5,
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                commercialRegisterPickedFile != null
                    ? Text(
                  commercialRegisterFileName!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                )
                    : const Text(
                  'Upload Commercial Register',
                  style: TextStyle(
                    color: Color(0xFFB1B9C5),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 91,
                  height: 34,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x0C4A71FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: MaterialButton(
                    height: 34,
                    minWidth: 91,
                    onPressed: (){commercialRegisterPickFile();},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_outlined, color: Color(0xFF4A71FF) ,),
                        SizedBox(width: 6),
                        Text(
                          'Upload',
                          style: TextStyle(
                            color: Color(0xFF4A71FF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 37),
        Row(
          children: [
            buttonWidget(
              kind: 1,
              text: 'Previous',
              color: white,
              width: 130,
              onPressed: (){
                navigateTo(context, 'LocationDetailsScreenRoute');
              },
            ),
            const Spacer(),
            buttonWidget(
              kind: 0,
              text: 'Next',
              color: primary,
              width: 200,
              onPressed: (){
                if(isEmpty){
                  setState(() {
                    isEmpty = !isEmpty ;
                  });
                }
                else{
                  navigateTo(context, 'SecurityDerailsScreenRoute');
                }
              },
            ),
          ],
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
    );
  }

  FilePickerResult? taxLicenseResult;
  String? taxLicenseFileName;
  static File? taxLicensePickedFile;


  Future<void> taxLicensePickFile() async {
    try {
      taxLicenseResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png'],
        allowCompression: false,
        allowMultiple: false,
      );

      if (taxLicenseResult != null) {
        setState((){
          taxLicenseFileName = taxLicenseResult!.files.first.name;
          taxLicensePickedFile = File(taxLicenseResult!.files.first.path!);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  FilePickerResult? taxCardResult;
  String? taxCardFileName;
  static File? taxCardPickedFile;

  Future<void> taxCardPickFile() async {
    try {
      taxCardResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png'],
        allowCompression: false,
        allowMultiple: false,
      );

      if (taxCardResult != null) {
        setState((){
          taxCardFileName = taxCardResult!.files.first.name;
          taxCardPickedFile = File(taxCardResult!.files.first.path!);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  FilePickerResult? commercialRegisterResult;
  String? commercialRegisterFileName;
  static File? commercialRegisterPickedFile;

  Future<void> commercialRegisterPickFile() async {
    try {
      commercialRegisterResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png','pdf'],
        allowCompression: false,
        allowMultiple: false,
      );

      if (commercialRegisterResult != null) {
        setState((){
          commercialRegisterFileName = commercialRegisterResult!.files.first.name;
          commercialRegisterPickedFile = File(commercialRegisterResult!.files.first.path!);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

}
