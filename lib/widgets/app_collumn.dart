import 'package:belajar/utilities/app_colors.dart';
import 'package:belajar/utilities/dimensi.dart';
import 'package:belajar/widgets/big_text.dart';
import 'package:belajar/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';

class AppCollumn extends StatelessWidget {
  final String text;
  
  const AppCollumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
          color: Colors.black,
        ),
        SizedBox(height: Dimensions.height10),
        Column(
          children: [
            Text(
              'lorem ipsum deler dadasdadasdasdadadadasdasdropaffafafaddqdqdqdqwdqwdqdwqdqdqfafafsafafafafaf',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndaTextWidget(
              icon: Icons.check_circle,
              text: 'Normal',
              iconColor: AppColors.lightGreen,
            ),
            IconAndaTextWidget(
              icon: Icons.price_check,
              text: 'Harga',
              iconColor: AppColors.lightGreen,
            ),
          ],
        ),
      ],
    );
  }
}
