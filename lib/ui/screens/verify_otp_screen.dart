import 'package:craft_bay/ui/screens/complete_profile_screen.dart';
import 'package:craft_bay/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_elevated_button.dart';
import '../widgets/app_textfield_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 46,
                ),
                SvgPicture.asset(
                  'assets/images/craft-bay-logo.svg',
                  width: 120,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Enter OTP Code",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "A 4 digit OTP code has been sent",
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 55,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.red,
                    selectedColor: AppColor.primaryColor,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {});
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 14,
                ),
                AppElevatedButton(
                  text: "Next",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompleteProfileScreen()));
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                    text: "This code will expire in",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: " 120s",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Resend Code"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
