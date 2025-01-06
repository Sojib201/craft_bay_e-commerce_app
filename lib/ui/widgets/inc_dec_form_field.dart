import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class incdecFormField extends StatefulWidget {
  const incdecFormField({
    Key? key,
  }) : super(key: key);


  @override
  State<incdecFormField> createState() => _incdecFormFieldState();
}

class _incdecFormFieldState extends State<incdecFormField> {
  int currentValue = 1;
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = currentValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            currentValue++;
            controller.text = currentValue.toString();
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () {
            if (currentValue > 1) {
              currentValue--;
              controller.text = currentValue.toString();
            }
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.remove,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
