import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/space.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: blueButton,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        verticalSpace(10),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          onPressed: () {},
          color: whiteColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'What you can download',
              style: TextStyle(
                  color: blackColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
