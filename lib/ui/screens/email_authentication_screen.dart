import 'package:craft_bay/ui/screens/verify_otp_screen.dart';
import 'package:craft_bay/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_elevated_button.dart';
import '../widgets/app_textfield_widget.dart';

class EmailAuthentication extends StatefulWidget {
  const EmailAuthentication({Key? key}) : super(key: key);

  @override
  State<EmailAuthentication> createState() => _EmailAuthenticationState();
}

class _EmailAuthenticationState extends State<EmailAuthentication> {
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
                  "Welcome Back",
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
                  "Please Enter Your Email Address",
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Email",
                  labelText: "Email",
                ),
                const SizedBox(
                  height: 14,
                ),
                AppElevatedButton(
                  text: "Next",
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOtpScreen()));},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
