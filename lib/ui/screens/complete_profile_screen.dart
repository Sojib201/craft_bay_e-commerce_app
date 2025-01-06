import 'package:craft_bay/ui/widgets/app_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../widgets/app_elevated_button.dart';
import 'main_bottom_navigation_bar.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
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
                  "Complete Profile",
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
                  "Get Started With Us With Your Details",
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 14,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  labelText: "First Name",
                  hintText: "First Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  labelText: "Last Name",
                  hintText: "Last Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  labelText: "Mobile",
                  hintText: "Mobile",
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  labelText: "City",
                  hintText: "City",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  Maxlines: 4,
                  controller: TextEditingController(),
                  labelText: "Shipping Address",
                  hintText: "Shipping Address",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(
                  text: "Complete",
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainNavigationBar()),
                        (route) => false);
                  },
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
