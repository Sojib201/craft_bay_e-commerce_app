import 'package:flutter/material.dart';

import '../widgets/app_elevated_button.dart';
import '../widgets/app_textfield_widget.dart';
import 'main_bottom_navigation_bar.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({Key? key}) : super(key: key);

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Review",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: BackButton(
          color: Colors.black54,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  labelText: "First Name",
                  hintText: "First Name",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  labelText: "Last Name",
                  hintText: "Last Name",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  Maxlines: 10,
                  controller: TextEditingController(),
                  labelText: "Write Review",
                  hintText: "Write Review",
                ),
                const SizedBox(
                  height: 20,
                ),
                AppElevatedButton(
                  text: "Submit",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
